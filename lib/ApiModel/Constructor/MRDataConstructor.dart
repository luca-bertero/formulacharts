import 'package:web_f1/ApiModel/Constructor/ConstructorTable.dart';
import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/Dto/ConstructorDto/MRDataConstructorDto.dart';


class MRDataConstructor extends MRData{

  ConstructorTable constructorTable;

  MRDataConstructor({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.constructorTable,
  });

  factory MRDataConstructor.fromJson(Map<String, dynamic> json) {
    return MRDataConstructor(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      constructorTable: ConstructorTable.fromJson(json['MRData']['ConstructorTable']),
    );
  }

  @override
  MRDataConstructorDto map(){
    return MRDataConstructorDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      constructorTable: constructorTable.map(),
    );
  }
}