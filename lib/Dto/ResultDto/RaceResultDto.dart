import 'package:web_f1/Dto/CircuitDto/CircuitDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';

class RaceResultDto {
  final int season;
  final int round;
  final String url;
  final String raceName;
  final CircuitDto circuit;
  final String? date;
  final String? time;
  final List<ResultDto> results;

  RaceResultDto(
      {required this.season,
      required this.round,
      required this.url,
      required this.raceName,
      required this.circuit,
      this.date,
      this.time,
      required this.results,
      });
}