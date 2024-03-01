import 'package:web_f1/Dto/StandingDto/ConstructorStandingDto.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';

class StandingsListDto {
  final int season;
  final int round;
  final List<ConstructorStandingsDto>? constructorStandings;
  final List<DriverStandingsDto>? driverStandings;

  StandingsListDto({
    required this.season,
    required this.round,
    this.constructorStandings,
    this.driverStandings,
  });
}
