import 'package:web_f1/Dto/DriverDto/DriverDto.dart';

abstract interface class IDriverService{

  Future<List<DriverDto>> getDriversBySeason(int season){
    throw UnimplementedError();
  }

  Future<List<DriverDto>> getDriversBySeasonAndRound(int season, int round){
    throw UnimplementedError();
  }
}