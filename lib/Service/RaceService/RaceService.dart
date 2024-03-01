import 'package:injector/injector.dart';
import 'package:web_f1/Constant/Constant.dart';
import 'package:web_f1/Service/DriverService/IDriverService.dart';
import 'package:web_f1/Service/RaceService/IRaceService.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Dto/RaceDto/MRDataRaceDto.dart';
import 'package:web_f1/Dto/RaceDto/RaceDto.dart';
import 'package:web_f1/Dto/RaceDto/TimingDto.dart';
import 'package:web_f1/Repository/Abstraction/IUnitOfWork.dart';

class RaceService implements IRaceService{
  final IUnitOfWork _unitOfWork;

  final IDriverService _driverController = Injector.appInstance.get<IDriverService>();

  RaceService({required IUnitOfWork unitOfWork}) : _unitOfWork = unitOfWork;

  
  @override
  Future<List<TimingDto>> getLapsBySeasonRoundAndDriver(int season, int round, String driverId) async {
    String url = '${Constant.BASE_URL}$season/$round/drivers/$driverId/laps${Constant.FORMAT}';
    MRDataRaceDto mrDataDto = await _unitOfWork.racesRepository.getMRData(url);
    List<RaceDto> race = mrDataDto.raceTable.races;
    List<LapsDto> laps = race.expand((x) => x.laps!).toList();
    List<TimingDto> timing =  laps.expand((e) => e.timings).toList();
    return timing; 
  }

  @override
  Future<Map<String, List<LapsDto>>> getLapsBySeasonRoundAllDriver(int season, int round) async {
    List<DriverDto> driver = await _driverController.getDriversBySeasonAndRound(season, round);
    Map<String, List<LapsDto>> lapsfordriver = <String, List<LapsDto>>{};
    for (var d in driver){
      String url = '${Constant.BASE_URL}$season/$round/drivers/${d.driverId}/laps${Constant.FORMAT}';
      MRDataRaceDto mrDataDto = await _unitOfWork.racesRepository.getMRData(url);
      List<RaceDto> race = mrDataDto.raceTable.races;
      List<LapsDto> laps = race.expand((x) => x.laps!).toList();
      //allDriver.add(mrDataDto);
      lapsfordriver[d.driverId] = laps;
    }
    
    return lapsfordriver; 
  }

  @override
  Future<List<RaceDto>> getRaceBySeason(int season) async {
    String url = '${Constant.BASE_URL}$season${Constant.FORMAT}';
    MRDataRaceDto mrDataDto = await _unitOfWork.racesRepository.getMRData(url);
    List<RaceDto> raceList = mrDataDto.raceTable.races;
    return raceList; 
  }
  
  @override
  Future<Map<DriverDto, List<LapsDto>>> getLapsBySeasonRoundAllDriverDto(int season, int round) async {
    List<DriverDto> driver = await _driverController.getDriversBySeasonAndRound(season, round);
    Map<DriverDto, List<LapsDto>> lapsfordriver = <DriverDto, List<LapsDto>>{};
    for (var d in driver){
      String url = '${Constant.BASE_URL}$season/$round/drivers/${d.driverId}/laps${Constant.FORMAT}';
      MRDataRaceDto mrDataDto = await _unitOfWork.racesRepository.getMRData(url);
      List<RaceDto> race = mrDataDto.raceTable.races;
      List<LapsDto> laps = race.expand((x) => x.laps!).toList();
      //allDriver.add(mrDataDto);
      lapsfordriver[d] = laps;
    }
    
    return lapsfordriver; 
  }
  
  @override
  Future<String> getRaceNameBySeasonAndRound(int season, int round) async {
    var raceList = await getRaceBySeason(season);
    var race = raceList.firstWhere((e) => e.round == round);
    return race.raceName;
  }

}