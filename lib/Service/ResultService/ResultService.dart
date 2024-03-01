import 'package:web_f1/Constant/Constant.dart';
import 'package:web_f1/Service/ResultService/IResultService.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/ResultDto/MRDataResultDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';
import 'package:web_f1/Repository/Abstraction/IUnitOfWork.dart';

class ResultService implements IResultService {  
  
  final IUnitOfWork _unitOfWork;

  ResultService({required IUnitOfWork unitOfWork}) : _unitOfWork = unitOfWork;

  @override
  Future<DriverDto> getRaceWinner(int year, int race) async {
    String url = '${Constant.BASE_URL}$year/$race/results${Constant.FORMAT}';
    MRDataResultDto mrDataDto = await _unitOfWork.resultsRepository.getMRData(url);
    var result = mrDataDto.resultTable.raceResults.expand((e) => e.results);
    DriverDto raceWinner = result.firstWhere((element) => element.position == 1).driver;
    return raceWinner;
  }
  
  @override
  Future<List<ResultDto>> getRaceResult(int year, int race) async {
    String url = '${Constant.BASE_URL}$year/$race/results${Constant.FORMAT}';
    MRDataResultDto mrDataDto = await _unitOfWork.resultsRepository.getMRData(url);
    var result = mrDataDto.resultTable.raceResults.expand((e) => e.results).toList();
    result.sort((a,b) => a.position.compareTo(b.position));
    return result;
  }
}
