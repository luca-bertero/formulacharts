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

class DriverDifferenceLaptimeChart extends ConsumerStatefulWidget {
  final int year;
  final int raceNumber;
  const DriverDifferenceLaptimeChart({super.key, required this.year, required this.raceNumber});


  @override
  ConsumerState<DriverDifferenceLaptimeChart> createState() => _DriverDifferenceLaptimeChartState();
}

class _DriverDifferenceLaptimeChartState extends ConsumerState<DriverDifferenceLaptimeChart> {

List<int> _formatDataSelectedDriver(List<int> numericLapTime, List<int> selectedDriverLaptime)
{
  List<int> delta = List<int>.empty(growable: true);
  List<int> time = List<int>.filled(1, 0, growable: true);

  if(numericLapTime.isEmpty || selectedDriverLaptime.isEmpty){
    return time;
  }

  //The graph for the race winner will be the x axis at the value of 0
  for (var i = 0; i < numericLapTime.length && i < selectedDriverLaptime.length; i++) {
    delta.add(selectedDriverLaptime[i] - numericLapTime[i]); 
  }

  for(var j = 0; j < delta.length; j++)
  {
    time.add(time[j] + delta[j]);
  }

  return time;
}

List<CartesianSeries<int, int>> _getaxisDriverSelected(Map<DriverDto,List<LapsDto>?> data, DriverDto selectedDriver) {
  List<LineSeries<int, int>> linesSeries = List.empty(growable: true); 

  List<TimingDto> selectedDriverTiming = data[selectedDriver]!.expand((e) => e.timings).toList();
  List<int> selectedDriverNumericLaptime = selectedDriverTiming.map((e) => e.numericTime).toList();
  int i = 0;

  for(var driver in data.keys){
    
    List<TimingDto> driverTiming = data[driver]!.expand((e) => e.timings).toList();
    List<int> numericLaptime = driverTiming.map((e) => e.numericTime).toList();

    List<int> formattedLapTime = _formatDataSelectedDriver(numericLaptime, selectedDriverNumericLaptime);
    var singleLineSeries = LineSeries<int, int>(
                    dataSource: formattedLapTime,
                    xValueMapper: (int time, int lapNumber) => lapNumber,
                    yValueMapper: (int time, _) => time,
                    dataLabelMapper: (int data, _) => Converter.convertToString(data),
                    name: driver.driverId.capitalizeFormatDriver(),
                    color: driver == selectedDriver ? const Color.fromARGB(255, 0, 0, 0) : chartColor[i],
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
                          //enablePanning: true,
                          enableSelectionZooming: true,
                          selectionRectBorderColor: Colors.red,
                          selectionRectColor: Colors.white60
                          //enableMouseWheelZooming: true,
                        );

 @override
  Widget build(BuildContext context) {
    final raceWinner = ref.watch(raceWinnerProvider(RaceInfo(year: widget.year, race: widget.raceNumber)));
    final DriverDto? driver = ref.watch(choosedDriver);
    final drivers = ref.watch(driversProvider(RaceInfo(year: widget.year, race: widget.raceNumber)));

    final AsyncValue<Map<DriverDto, List<LapsDto>>> lapTimesPerDriver = ref.watch(activityProvider(RaceInfo(year: widget.year, race: widget.raceNumber)));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DropdownMenu(
                label: const Text('Driver'),
                width: 160,
                enabled: !drivers.isLoading,
                initialSelection: raceWinner.value,
                trailingIcon:  drivers.isLoading ? const CircularProgressIndicator() : const Icon(Icons.arrow_drop_down),
                dropdownMenuEntries: drivers.isLoading
                                  ? List<DropdownMenuEntry<DriverDto>>.empty() 
                                  : drivers.value!.map((e) => DropdownMenuEntry(value: e, label: e.driverId.capitalizeFormatDriver())).toList(),
                onSelected: (DriverDto? driver) {
                  ref.read(choosedDriver.notifier).addTodo(driver!);
                }
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 12, bottom: 12),
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
                        overflowMode: LegendItemOverflowMode.wrap
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
                      series: raceWinner.isLoading ? List<CartesianSeries>.empty() : _getaxisDriverSelected(value, driver ?? raceWinner.value!),
                      zoomPanBehavior: _zoomPanBehavior,
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