import 'package:web_f1/ApiModel/Result/RaceResult.dart';
import 'package:web_f1/Dto/ResultDto/RaceResultDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultTableDto.dart';

class ResultTable {
  final String season;
  final String? round;
  final List<RaceResult> raceResults;
  
  ResultTable({required this.season, this.round, required this.raceResults});

  factory ResultTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> raceResultList = json['Races'];
    List<RaceResult> raceResults = raceResultList.map((e) => RaceResult.fromJson(e)).toList();

    return ResultTable(
      season: json['season'],
      round: json['round'],
      raceResults: raceResults,
    );
  }

  ResultTableDto map(){
    List<RaceResultDto> raceResultList = raceResults.map((i) => i.map()).toList();
    return ResultTableDto(
      season: int.parse(season),
      round: int.tryParse(round ?? "null"),
      raceResults: raceResultList,
      );
  }
}
