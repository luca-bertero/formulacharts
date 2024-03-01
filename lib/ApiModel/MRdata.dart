import 'package:web_f1/ApiModel/Circuit/MRDataCircuit.dart';
import 'package:web_f1/ApiModel/Constructor/MRDataConstructor.dart';
import 'package:web_f1/ApiModel/Driver/MRDataDrivers.dart';
import 'package:web_f1/ApiModel/Race/MRDataRace.dart';
import 'package:web_f1/ApiModel/Result/MRDataResult.dart';
import 'package:web_f1/ApiModel/Season/MRDataSeason.dart';
import 'package:web_f1/ApiModel/Standing/MRDataStanding.dart';
import 'package:web_f1/ApiModel/Status/MRDataStatus.dart';
import 'package:web_f1/Dto/MRDataDto.dart';

abstract class MRData {
  String xmlns;
  String series;
  String url;
  String limit;
  String offset;
  String total;

  MRData({
    required this.xmlns,
    required this.series,
    required this.url,
    required this.limit,
    required this.offset,
    required this.total,
  });

  factory MRData.fromJson(Type type, Map<String, dynamic> json) {
    switch (type) {
      case MRDataDrivers:
        return MRDataDrivers.fromJson(json);
      case MRDataRace:
        return MRDataRace.fromJson(json);
      case MRDataCircuits:
        return MRDataCircuits.fromJson(json);
      case MRDataSeasons:
        return MRDataSeasons.fromJson(json);
      case MRDataConstructor:
        return MRDataConstructor.fromJson(json);
      case MRDataStatus:
        return MRDataStatus.fromJson(json);
      case MRDataStanding:
        return MRDataStanding.fromJson(json);
      case MRDataResult:
        return MRDataResult.fromJson(json);  
      default:
        throw Exception("error: json not supported");
    }
  }

  MRDataDto map(){
    throw Exception("error in mapping");
  }
}