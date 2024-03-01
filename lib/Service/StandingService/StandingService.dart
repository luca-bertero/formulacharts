import 'package:web_f1/Constant/Constant.dart';
import 'package:web_f1/Service/StandingService/IStandingService.dart';
import 'package:web_f1/Dto/StandingDto/ConstructorStandingDto.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';
import 'package:web_f1/Dto/StandingDto/MRDataStandingDto.dart';
import 'package:web_f1/Dto/StandingDto/StandingListDto.dart';
import 'package:web_f1/Repository/Abstraction/IUnitOfWork.dart';

class StandingService implements IStandingService {  
  
  final IUnitOfWork _unitOfWork;

  StandingService({required IUnitOfWork unitOfWork}) : _unitOfWork = unitOfWork;

  @override
  Future<List<ConstructorStandingsDto>> getConstructorStandingBySeasonAndRound(int season, int round) async {
    String url = '${Constant.BASE_URL}$season/$round/constructorstandings${Constant.FORMAT}';
    MRDataStandingDto mrDataDto = await _unitOfWork.standingsRepository.getMRData(url);
    List<StandingsListDto> standingList = mrDataDto.standingTable.standingsLists;
    List<ConstructorStandingsDto> constructorStandings = standingList.expand((x) => x.constructorStandings!).toList();
    return constructorStandings;
  }

  @override
  Future<List<DriverStandingsDto>> getDriverStandingBySeasonAndRound(int season, int round) async {
    String url = '${Constant.BASE_URL}$season/$round/driverstandings${Constant.FORMAT}';
    MRDataStandingDto mrDataDto = await _unitOfWork.standingsRepository.getMRData(url);
    List<StandingsListDto> standingList = mrDataDto.standingTable.standingsLists;
    List<DriverStandingsDto> driverStandings = standingList.expand((x) => x.driverStandings!).toList();
    return driverStandings;
  }
}
