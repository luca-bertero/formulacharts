import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';

abstract interface class IResultService{

  Future<DriverDto> getRaceWinner(int year, int race){
      throw UnimplementedError();
  }

  Future<List<ResultDto>> getRaceResult(int year, int race){
      throw UnimplementedError();
  }
}