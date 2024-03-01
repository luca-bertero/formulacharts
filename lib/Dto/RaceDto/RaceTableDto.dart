import 'package:web_f1/Dto/RaceDto/RaceDto.dart';

class RaceTableDto {
  final int season;
  final int? round;
  final List<RaceDto> races;
  
  RaceTableDto({required this.season, this.round, required this.races});
}
