import 'package:web_f1/ApiModel/Driver/DriverTable.dart';
import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/Dto/DriverDto/MRDataDriversDto.dart';

class MRDataDrivers extends MRData{

  DriverTable driverTable;

  MRDataDrivers({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.driverTable,
  });

  factory MRDataDrivers.fromJson(Map<String, dynamic> json) {
    return MRDataDrivers(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      driverTable: DriverTable.fromJson(json['MRData']['DriverTable']),
    );
  }

  @override
  MRDataDriversDto map(){
    return MRDataDriversDto(
      xmlns: xmlns,
      series: series,
      url: url,
      limit: int.parse(limit),
      offset: int.parse(offset),
      total: int.parse(total),
      driverTable: driverTable.map(),
    );
  }
}