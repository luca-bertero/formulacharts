import 'package:web_f1/ApiModel/Constructor/Constructor.dart';
import 'package:web_f1/ApiModel/Driver/Driver.dart';
import 'package:web_f1/Dto/ConstructorDto/ConstructorDto.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';

class DriverStandings {
  final String position;
  final String positionText;
  final String points;
  final String wins;
  final Driver driver;
  final List<Constructor> constructors;

  DriverStandings({
    required this.position,
    required this.positionText,
    required this.points,
    required this.wins,
    required this.driver,
    required this.constructors,
  });

  factory DriverStandings.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['Constructors'];
    List<Constructor> constructorList = list.map((i) => Constructor.fromJson(i)).toList();

    return DriverStandings(
      position: json['position'],
      positionText: json['positionText'],
      points: json['points'],
      wins: json['wins'],
      driver: Driver.fromJson(json['Driver']),
      constructors: constructorList,
    );
  }

  DriverStandingsDto map(){

    List<ConstructorDto> constructorList = constructors.map((i) => i.map()).toList();

    return DriverStandingsDto(
      position: int.parse(position), 
      positionText: positionText,
      points: double.parse(points),
      wins: int.parse(wins),
      driver: driver.map(),
      constructors: constructorList,
    );
  }
}