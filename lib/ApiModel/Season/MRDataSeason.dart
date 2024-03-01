import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/ApiModel/Season/SeasonTable.dart';
import 'package:web_f1/Dto/SeasonDto/MRDataSeasonDto.dart';

class MRDataSeasons extends MRData{

  SeasonTable seasonTable;

  MRDataSeasons({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.seasonTable,
  });

  factory MRDataSeasons.fromJson(Map<String, dynamic> json) {
    return MRDataSeasons(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      seasonTable: SeasonTable.fromJson(json['MRData']['DriverTable']),
    );
  }

@override
  MRDataSeasonsDto map(){
    return MRDataSeasonsDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      seasonTable: seasonTable.map(),
    );
  }
}