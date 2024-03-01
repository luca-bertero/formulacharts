import 'package:web_f1/ApiModel/Standing/ConstructorStanding.dart';
import 'package:web_f1/ApiModel/Standing/DriverStandings.dart';
import 'package:web_f1/Dto/StandingDto/ConstructorStandingDto.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';
import 'package:web_f1/Dto/StandingDto/StandingListDto.dart';

class StandingsList {
  final String season;
  final String round;
  final List<ConstructorStandings>? constructorStandings;
  final List<DriverStandings>? driverStandings;

  StandingsList({
    required this.season,
    required this.round,
    this.constructorStandings,
    this.driverStandings,
  });

  factory StandingsList.fromJson(Map<String, dynamic> json) {
    List<dynamic>? listConstructor = json['ConstructorStandings'];
    List<ConstructorStandings>? constructorStandingsList =
        listConstructor?.map((i) => ConstructorStandings.fromJson(i)).toList();

    List<dynamic>? listDriver = json['DriverStandings'];
    List<DriverStandings>? driverStandingsList = listDriver?.map((i) => DriverStandings.fromJson(i)).toList();

    return StandingsList(
      season: json['season'],
      round: json['round'],
      constructorStandings: constructorStandingsList,
      driverStandings: driverStandingsList,
    );
  }

  StandingsListDto map(){
    List<ConstructorStandingsDto>? constructorStandingsList = constructorStandings?.map((i) => i.map()).toList();
    List<DriverStandingsDto>? driverStandingsList = driverStandings?.map((i) => i.map()).toList();

    return StandingsListDto(
      season: int.parse(season),
      round: int.parse(round),
      constructorStandings: constructorStandingsList,
      driverStandings: driverStandingsList,
    );
  }
}
