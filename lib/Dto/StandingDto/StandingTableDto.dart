import 'package:web_f1/Dto/StandingDto/StandingListDto.dart';

class StandingsTableDto {
  final int season;
  final int round;
  final List<StandingsListDto> standingsLists;

  StandingsTableDto({
    required this.season,
    required this.round,
    required this.standingsLists,
  });
}