import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/ApiModel/Race/RaceTable.dart';
import 'package:web_f1/Dto/RaceDto/MRDataRaceDto.dart';

class MRDataRace extends MRData{

  RaceTable raceTable;

  MRDataRace({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.raceTable,
  });

  factory MRDataRace.fromJson(Map<String, dynamic> json) {
    return MRDataRace(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      raceTable: RaceTable.fromJson(json['MRData']['RaceTable']),
    );
  }

  @override
  MRDataRaceDto map(){
    return MRDataRaceDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      raceTable: raceTable.map(),
    );
  }
}