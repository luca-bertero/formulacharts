import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/ApiModel/Standing/StandingTable.dart';
import 'package:web_f1/Dto/StandingDto/MRDataStandingDto.dart';

class MRDataStanding extends MRData{

  StandingsTable standingTable;

  MRDataStanding({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.standingTable,
  });

  factory MRDataStanding.fromJson(Map<String, dynamic> json) {
    return MRDataStanding(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      standingTable: StandingsTable.fromJson(json['MRData']['StandingsTable']),
    );
  }

  @override
  MRDataStandingDto map(){
    return MRDataStandingDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      standingTable: standingTable.map(),
    );
  }
}