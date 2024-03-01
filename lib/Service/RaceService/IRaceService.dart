import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Dto/RaceDto/RaceDto.dart';
import 'package:web_f1/Dto/RaceDto/TimingDto.dart';

abstract interface class IRaceService{

  Future<List<TimingDto>> getLapsBySeasonRoundAndDriver(int season, int round, String driverId){
    throw UnimplementedError();
  }

  Future<Map<String, List<LapsDto>>> getLapsBySeasonRoundAllDriver(int season, int round){
    throw UnimplementedError();
  }

  Future<List<RaceDto>> getRaceBySeason(int season){
    throw UnimplementedError();
  }

  Future<String> getRaceNameBySeasonAndRound(int season, int round){
    throw UnimplementedError();
  }

  Future<Map<DriverDto, List<LapsDto>>> getLapsBySeasonRoundAllDriverDto(int season, int round){
    throw UnimplementedError();
  }  

}