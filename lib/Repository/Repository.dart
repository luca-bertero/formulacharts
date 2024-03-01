import 'package:injector/injector.dart';
import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/Dto/MRDataDto.dart';
import 'package:web_f1/Repository/Abstraction/IRepository.dart';
import 'package:web_f1/RestApiCaller/RestApiCaller.dart';

class Repository<T extends MRData, K extends MRDataDto> 
implements IRepository<T,K> {  
  
  @override
  Future<K> getMRData(String url) async {
    RestApiCaller restApiCaller = Injector.appInstance.get<RestApiCaller>();
    MRData json = await restApiCaller.getData<T>(url);
    MRDataDto mrDataDto = json.map();
    return mrDataDto as K;
  }
}
