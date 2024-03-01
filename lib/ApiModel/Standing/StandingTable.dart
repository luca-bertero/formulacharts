import 'package:web_f1/ApiModel/Standing/StandingList.dart';
import 'package:web_f1/Dto/StandingDto/StandingListDto.dart';
import 'package:web_f1/Dto/StandingDto/StandingTableDto.dart';

class StandingsTable {
  final String season;
  final String round;
  final List<StandingsList> standingsLists;

  StandingsTable({
    required this.season,
    required this.round,
    required this.standingsLists,
  });

  factory StandingsTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['StandingsLists'];
    List<StandingsList> standingsList = list.map((i) => StandingsList.fromJson(i)).toList();

    return StandingsTable(
      season: json['season'],
      round: json['round'],
      standingsLists: standingsList,
    );
  }

  StandingsTableDto map(){
    List<StandingsListDto> standingListDto = standingsLists.map((i) => i.map()).toList();
    return StandingsTableDto(
      season: int.parse(season),
      round: int.parse(round),
      standingsLists: standingListDto,
    );
  }
}