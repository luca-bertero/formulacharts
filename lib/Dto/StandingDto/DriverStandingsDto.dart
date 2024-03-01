import 'package:web_f1/Dto/ConstructorDto/ConstructorDto.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';

class DriverStandingsDto {
  final int position;
  final String positionText;
  final double points;
  final int wins;
  final DriverDto driver;
  final List<ConstructorDto> constructors;

  DriverStandingsDto({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.driver,
    required this.constructors,
  });
}