import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';
import 'package:web_f1/Provider/ResultProvider.dart';
import 'package:web_f1/Utils/StringExtension.dart';

class RaceResultView extends ConsumerStatefulWidget {
  final int year;
  final int raceNumber;
  const RaceResultView({super.key, required this.year, required this.raceNumber});

  @override
  ConsumerState<RaceResultView> createState() => _RaceResultViewState();
}

class _RaceResultViewState extends ConsumerState<RaceResultView> with AutomaticKeepAliveClientMixin{

  
  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    
    super.build(context);

    final AsyncValue<List<ResultDto>> activity = ref.watch(resultRaceProvider(RaceInfo(year: widget.year, race: widget.raceNumber)));

    return Center(
    child: switch (activity) {
            AsyncData(:final value) =>

            ListView.builder(
              itemCount: value.length,
              itemBuilder: (BuildContext context, int index){
                return Center(
                  child: Card(
                    child: Column(
                      children: [
                        ListTile(
                        leading: Text(value[index].driver.familyName.capitalizeFormat()),
                        title: Text(value[index].time!.time ?? value[index].status),
                        )
                      ]                    
                    ),
                  ),
                );
              }
            ),
            AsyncError() => const Text('Oops, something unexpected happened'),
            _ => const CircularProgressIndicator(),
          },
        );
  }
}

