import 'package:web_f1/ApiModel/Circuit/Circuit.dart';
import 'package:web_f1/ApiModel/Race/Laps.dart';
import 'package:web_f1/ApiModel/Race/PitStop.dart';
import 'package:web_f1/ApiModel/Race/QualifyingResults.dart';
import 'package:web_f1/ApiModel/Race/SessionName.dart';
import 'package:web_f1/ApiModel/Result/Result.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Dto/RaceDto/PitStopDto.dart';
import 'package:web_f1/Dto/RaceDto/QualifyingResultDto.dart';
import 'package:web_f1/Dto/RaceDto/RaceDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';

class Race {
  final String season;
  final String round;
  final String url;
  final String raceName;
  final Circuit circuit;
  final String? date;
  final String? time;
  final List<Laps>? laps;
  final List<QualifyingResult>? qualifyingResults;
  final List<PitStop>? pitstops;
  final FirstPractice? firstPractice;
  final SecondPractice? secondPractice;
  final ThirdPractice? thirdPractice;
  final Qualifying? qualifying;
  final Sprint? sprint;
  final List<Result>? results;



  Race(
      {required this.season,
      required this.round,
      required this.url,
      required this.raceName,
      required this.circuit,
      this.date,
      this.time,
      this.laps,
      this.qualifyingResults,
      this.pitstops,
      this.firstPractice,
      this.secondPractice,
      this.thirdPractice,
      this.qualifying,
      this.sprint,
      this.results,
      });

  factory Race.fromJson(Map<String, dynamic> json) {
    List<dynamic>? lapsJson = json['Laps'];
    var laps = lapsJson?.map((lapJson) => Laps.fromJson(lapJson)).toList();

    List<dynamic>? qualifyingResultsJson = json['QualifyingResults'];
    var qualifyingResults = qualifyingResultsJson?.map((lapJson) => QualifyingResult.fromJson(lapJson)).toList();

    List<dynamic>? pitStopJson = json['PitStops'];
    var pitStop = pitStopJson?.map((pitStopJson) => PitStop.fromJson(pitStopJson)).toList();

    List<dynamic>? resultsJson = json['Results'];
    var results = resultsJson?.map((resultsJson) => Result.fromJson(resultsJson)).toList();


    return Race(
      season: json['season'],
      round: json['round'],
      url: json['url'],
      raceName: json['raceName'],
      circuit: Circuit.fromJson(json['Circuit']),
      date: json['date'],
      time: json['time'],
      laps: laps,
      qualifyingResults: qualifyingResults,
      pitstops: pitStop,
      firstPractice: FirstPractice.fromJson(json['FirstPractice']),
      secondPractice: SecondPractice.fromJson(json['SecondPractice']),
      thirdPractice: ThirdPractice.fromJson(json['ThirdPractice']),
      qualifying: Qualifying.fromJson(json['Qualifying']),
      sprint: Sprint.fromJson(json['Sprint']),
      results: results,
    );
  }

    RaceDto map() {
      List<LapsDto>? lapsList = laps?.map((i) => i.map()).toList();
      List<QualifyingResultDto>? qualifyList = qualifyingResults?.map((i) => i.map()).toList();
      List<PitStopDto>? pitStopList = pitstops?.map((i) => i.map()).toList();
      List<ResultDto>? results = this.results?.map((i) => i.map()).toList();

      return RaceDto(
        season: int.parse(season),
        round: int.parse(round),
        urlWiki: url,
        raceName: raceName,
        circuit: circuit.map(),
        date: date,
        time: time,
        laps: lapsList,
        qualifyingResults: qualifyList,
        pitstops: pitStopList,
        firstPractice: firstPractice?.map(),
        secondPractice: secondPractice?.map(),
        thirdPractice: thirdPractice?.map(),
        qualifying: qualifying?.map(),
        sprint: sprint?.map(),
        results: results,
      );
    }
}
