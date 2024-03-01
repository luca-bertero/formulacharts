import 'package:web_f1/ApiModel/Circuit/Circuit.dart';
import 'package:web_f1/ApiModel/Result/Result.dart';
import 'package:web_f1/Dto/ResultDto/RaceResultDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';

class RaceResult {
  final String season;
  final String round;
  final String url;
  final String raceName;
  final Circuit circuit;
  final String? date;
  final String? time;
  final List<Result> results;

  RaceResult(
      {required this.season,
      required this.round,
      required this.url,
      required this.raceName,
      required this.circuit,
      this.date,
      this.time,
      required this.results,
      });

  factory RaceResult.fromJson(Map<String, dynamic> json) {

    List<dynamic> resultsJson = json['Results'];
    var results = resultsJson.map((resultsJson) => Result.fromJson(resultsJson)).toList();


    return RaceResult(
      season: json['season'],
      round: json['round'],
      url: json['url'],
      raceName: json['raceName'],
      circuit: Circuit.fromJson(json['Circuit']),
      date: json['date'],
      time: json['time'],
      results: results,
    );

    
  }
    RaceResultDto map() {
      List<ResultDto>? resultList = results.map((i) => i.map()).toList();

      return RaceResultDto(
        season: int.parse(season),
        round: int.parse(round),
        url: url,
        raceName: raceName,
        circuit: circuit.map(),
        date: date,
        time: time,
        results: resultList,
      );
    }
}
