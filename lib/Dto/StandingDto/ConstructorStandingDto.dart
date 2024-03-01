import 'package:web_f1/Dto/ConstructorDto/ConstructorDto.dart';

class ConstructorStandingsDto {
  final int? position;
  final String? positionText;
  final int? points;
  final int? wins;
  final ConstructorDto? constructor;

  ConstructorStandingsDto({
    this.position,
    this.positionText,
    this.points,
    this.wins,
    this.constructor,
  });
}