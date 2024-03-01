import 'package:web_f1/Dto/ResultDto/RaceResultDto.dart';

class ResultTableDto {
  final int season;
  final int? round;
  final List<RaceResultDto> raceResults;
  
  ResultTableDto({required this.season, this.round, required this.raceResults});
}