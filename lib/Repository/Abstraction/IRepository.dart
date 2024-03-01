import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/Dto/MRDataDto.dart';

abstract interface class IRepository<T extends MRData, K extends MRDataDto>{

  Future<K> getMRData(String url) async {
    throw UnimplementedError();
  }
}