import 'package:web_f1/Dto/StandingDto/ConstructorStandingDto.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';

abstract interface class IStandingService{

  Future<List<DriverStandingsDto>> getDriverStandingBySeasonAndRound(int season, int round){
    throw UnimplementedError();
  }

  Future<List<ConstructorStandingsDto>> getConstructorStandingBySeasonAndRound(int season, int round){
    throw UnimplementedError();
  }
}