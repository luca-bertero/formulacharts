import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Dto/RaceDto/TimingDto.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';
import 'package:web_f1/Provider/LapChartProvider.dart';
import 'package:web_f1/Utils/converter.dart';
import 'package:web_f1/Utils/StringExtension.dart';
import 'package:web_f1/View/Component/ChartColors.dart';
import 'package:web_f1/View/Component/zoom_button.dart';

class AverageLaptimeChart extends ConsumerStatefulWidget {
  final int year;
  final int raceNumber;
  const AverageLaptimeChart({super.key, required this.year, required this.raceNumber});

 @override
  ConsumerState<AverageLaptimeChart> createState() => _AverageLaptimeChartState();
}

class _AverageLaptimeChartState extends ConsumerState<AverageLaptimeChart> {

List<int> _formatData(List<int> numericLapTime, int averageLapTime)
{
  List<int> delta = List<int>.empty(growable: true);
  List<int> time = List<int>.filled(1, 0, growable: true);

  //The graph for the race winner will be the x axis at the value of 0
  for (var i = 0; i < numericLapTime.length; i++) {
    delta.add(averageLapTime - numericLapTime[i]); 
  }

  for(var j = 0; j < delta.length; j++)
  {
    time.add(time[j] + delta[j]);
  }

  return time;
}

List<CartesianSeries<int, int>> _getaxis(Map<DriverDto,List<LapsDto>?> data, int averageLapTime) {
  List<LineSeries<int, int>> linesSeries = List.empty(growable: true); 
  int i = 0;

  for(var driver in data.keys){

    List<TimingDto> driverTiming = data[driver]!.expand((e) => e.timings).toList();
    List<int> numericLaptime = driverTiming.map((e) => e.numericTime).toList();

    List<int> formattedData = _formatData(numericLaptime, averageLapTime);
    var singleLineSeries = LineSeries<int, int>(
                    dataSource: formattedData,
                    xValueMapper: (int time, int lapNumber) => lapNumber,
                    yValueMapper: (int time, _) => time,
                    dataLabelMapper: (int data, _) => Converter.convertToString(data),
                    name: driver.driverId.capitalizeFormatDriver(),
                    color: chartColor[i],
                    // Enable data label
                    dataLabelSettings: const DataLabelSettings(isVisible: false),
                    );

    linesSeries.add(singleLineSeries);
    i++;
  }

  return linesSeries;            
}

final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
                          //enablePinching: true,
                          zoomMode: ZoomMode.xy,
                          enablePanning: true,
                          enableSelectionZooming: true,
                          selectionRectBorderColor: Colors.red,
                          selectionRectColor: Colors.white60
                          //enableMouseWheelZooming: true,
                        );

 @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);

    final lapTimesPerDriver = ref.watch(activityProvider(RaceInfo(year: widget.year, race: widget.raceNumber)));

    return Column(
      children: [
        Center(child: Text(Converter.convertToString(counter.round()))),
        Slider(
          value: counter,
          max: 160000,
          min: 60000,
          divisions: 100,
          label: Converter.convertToString(counter.round()),
          onChanged: (value) {
            ref.read(counterProvider.notifier).state = value;
          }
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4, top: 12, bottom: 12),
                child: Text("Zoom:"),
              ),
              ZoomButton(
                zoomAction: _zoomPanBehavior.zoomIn, 
                icon: Icons.add
              ),
              ZoomButton(
                zoomAction: _zoomPanBehavior.zoomOut, 
                icon: Icons.remove
              ),
              ZoomButton(
                zoomAction: _zoomPanBehavior.reset, 
                icon: Icons.refresh
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
          child: switch (lapTimesPerDriver) {
                  AsyncData(:final value) =>
                    SfCartesianChart(
                    primaryXAxis: const NumericAxis(
                      title: AxisTitle(text: "Laps"),
                      ),
                    primaryYAxis: NumericAxis(
                      title: const AxisTitle(text: "Time Difference"),
                      interval: 50000,
                      axisLabelFormatter: ((AxisLabelRenderDetails details){ 
                        int numericLaptime = details.value.toInt();
                        String lapTime = Converter.convertToString(numericLaptime);
                        return ChartAxisLabel(lapTime, details.textStyle);
                      }),
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(color: Colors.transparent)
                    ),
                    // Chart title
                    //title: ChartTitle(text: _raceWinner.driverId),
                    // Enable legend
                    legend: const Legend(
                      isVisible: true, 
                      position: LegendPosition.bottom,
                      overflowMode: LegendItemOverflowMode.wrap,
                      toggleSeriesVisibility: true,
                    ),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    onTooltipRender: ((TooltipArgs args){ 
                      List<String> lapNumberAndtime = args.text!.split(':');
                      String lapNumber = lapNumberAndtime[0].trim();
                      String lapTime = lapNumberAndtime[1].trim();
                      int numericLaptime = int.parse(lapTime);
                      args.text = '$lapNumber • ${Converter.convertToString(numericLaptime)}';
                    }),
                    series: _getaxis(value, counter.toInt()),
                    zoomPanBehavior: _zoomPanBehavior
                                    ),
                        
                  AsyncError() => const Text('Oops, something unexpected happened'),
                  _ => const CircularProgressIndicator(),
                },
          ),
        ),
      ],
    );     
  }
}
