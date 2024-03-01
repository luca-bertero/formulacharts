import 'package:web_f1/ApiModel/Race/Race.dart';
import 'package:web_f1/Dto/RaceDto/RaceDto.dart';
import 'package:web_f1/Dto/RaceDto/RaceTableDto.dart';

class RaceTable {
  final String season;
  final String? round;
  final List<Race> races;
  
  RaceTable({required this.season, this.round, required this.races});

  factory RaceTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> raceList = json['Races'];
    List<Race> races = raceList.map((e) => Race.fromJson(e)).toList();

    return RaceTable(
      season: json['season'],
      round: json['round'],
      races: races,
    );
  }

  RaceTableDto map(){
    List<RaceDto> raceList = races.map((i) => i.map()).toList();
    return RaceTableDto(
      season: int.parse(season),
      round: int.parse(round ?? '0'),
      races: raceList,
      );
  }
}
