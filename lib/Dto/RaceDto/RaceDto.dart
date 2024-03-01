import 'package:web_f1/Dto/CircuitDto/CircuitDto.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Dto/RaceDto/PitStopDto.dart';
import 'package:web_f1/Dto/RaceDto/QualifyingResultDto.dart';
import 'package:web_f1/Dto/RaceDto/SessionNameDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';


class RaceDto {
  final int season;
  final int round;
  final String urlWiki;
  final String raceName;
  final CircuitDto circuit;
  final String? date;
  final String? time;
  final List<LapsDto>? laps;
  final List<QualifyingResultDto>? qualifyingResults;
  final List<PitStopDto>? pitstops;
  final FirstPracticeDto? firstPractice;
  final SecondPracticeDto? secondPractice;
  final ThirdPracticeDto? thirdPractice;
  final QualifyingDto? qualifying;
  final SprintDto? sprint;
  final List<ResultDto>? results;

  RaceDto(
      {required this.season,
      required this.round,
      required this.urlWiki,
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
}
