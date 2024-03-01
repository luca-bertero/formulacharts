import 'package:dio/dio.dart';
import 'package:web_f1/ApiModel/MRdata.dart';

class RestApiCaller{
  
  final Dio _dio = Dio();
  static final Map<String, MRData> _cache = <String, MRData>{};


  Future<MRData> getData<T extends MRData>(String url) async{
  //_cache.clear();

  if(!_cache.containsKey(url)){
    final response = await _dio.get(url);
    if(response.statusCode == 200){
      var json = response.data;
      var unit = MRData.fromJson(T, json);
      _cache[url] = unit;
    }
    else{
      throw Exception("error ${response.statusCode}: ${response.statusMessage}");
    }
  }
    return _cache[url]!;
  }
}