import 'package:web_f1/ApiModel/Constructor/Constructor.dart';
import 'package:web_f1/Dto/StandingDto/ConstructorStandingDto.dart';

class ConstructorStandings {
  final String? position;
  final String? positionText;
  final String? points;
  final String? wins;
  final Constructor? constructor;

  ConstructorStandings({
    this.position,
    this.positionText,
    this.points,
    this.wins,
    this.constructor,
  });

  factory ConstructorStandings.fromJson(Map<String, dynamic>? json) {
    return json != null ? ConstructorStandings(
      position: json['position'],
      positionText: json['positionText'],
      points: json['points'],
      wins: json['wins'],
      constructor: Constructor.fromJson(json['Constructor']),
    ) : ConstructorStandings();
  }

  ConstructorStandingsDto map(){
    return ConstructorStandingsDto(
      position: int.parse(position!),
      positionText: positionText,
      points: int.parse(points!),
      wins: int.parse(wins!),
      constructor: constructor!.map(),
    );
  }
}