import 'package:web_f1/ApiModel/Circuit/CircuitTable.dart';
import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/Dto/CircuitDto/MRDataCircuitsDto.dart';

class MRDataCircuits extends MRData{

  CircuitTable circuitTable;

  MRDataCircuits({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.circuitTable,
  });

  factory MRDataCircuits.fromJson(Map<String, dynamic> json) {
    return MRDataCircuits(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      circuitTable: CircuitTable.fromJson(json['MRData']['CircuitTable']),
    );
  }

  @override
  MRDataCircuitsDto map(){
    return MRDataCircuitsDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      circuitTable: circuitTable.map(),
    );
  }
}