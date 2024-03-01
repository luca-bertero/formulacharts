import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/ApiModel/Result/ResultTable.dart';
import 'package:web_f1/Dto/ResultDto/MRDataResultDto.dart';

class MRDataResult extends MRData{

  ResultTable resultTable;

  MRDataResult({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.resultTable,
  });

  factory MRDataResult.fromJson(Map<String, dynamic> json) {
    return MRDataResult(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      resultTable: ResultTable.fromJson(json['MRData']['RaceTable']),
    );
  }

  @override
  MRDataResultDto map(){
    return MRDataResultDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      resultTable: resultTable.map(),
    );
  }
}