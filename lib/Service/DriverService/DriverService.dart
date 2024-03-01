import 'package:web_f1/Constant/Constant.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/DriverDto/MRDataDriversDto.dart';
import 'package:web_f1/Service/DriverService/IDriverService.dart';
import 'package:web_f1/Repository/Abstraction/IUnitOfWork.dart';

class DriverService implements IDriverService{

  final IUnitOfWork _unitOfWork;

  DriverService({required IUnitOfWork unitOfWork}) : _unitOfWork = unitOfWork;

  @override
  Future<List<DriverDto>> getDriversBySeason(int season) async{
    String url = '${Constant.BASE_URL}$season/drivers${Constant.FORMAT}';
    MRDataDriversDto mrDataDriversDto = await _unitOfWork.driversRepository.getMRData(url);
    List<DriverDto> mrDataDriversDtoList = mrDataDriversDto.driverTable.driver;
    return mrDataDriversDtoList;
  }

  @override
  Future<List<DriverDto>> getDriversBySeasonAndRound(int season, int round) async{
    String url = '${Constant.BASE_URL}$season/$round/drivers${Constant.FORMAT}';
    MRDataDriversDto mrDataDriversDto = await _unitOfWork.driversRepository.getMRData(url);
    List<DriverDto> mrDataDriversDtoList = mrDataDriversDto.driverTable.driver;
    return mrDataDriversDtoList;
  }
}