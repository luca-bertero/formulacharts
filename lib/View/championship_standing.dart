import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';
import 'package:web_f1/Provider/ChampionshipStandingProvider.dart';
import 'package:web_f1/Utils/StringExtension.dart';

class ChampionshipStanding extends ConsumerStatefulWidget {
  final int year;
  final int round;
  const ChampionshipStanding({super.key, required this.year, required this.round});

@override
  ConsumerState<ChampionshipStanding> createState() => _ChampionshipStandingState();

}

class _ChampionshipStandingState extends ConsumerState<ChampionshipStanding> with AutomaticKeepAliveClientMixin{


  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<DriverStandingsDto>> activity = ref.watch(standingProvider(RaceInfo(year: widget.year, race: widget.round)));

    super.build(context);

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
                        title: Text(value[index].points.toString()),
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