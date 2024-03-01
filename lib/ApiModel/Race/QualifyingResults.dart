import 'package:web_f1/ApiModel/Constructor/Constructor.dart';
import 'package:web_f1/ApiModel/Driver/Driver.dart';
import 'package:web_f1/Dto/RaceDto/QualifyingResultDto.dart';

class QualifyingResult {
  final String number;
  final String position;
  final Driver driver;
  final Constructor constructor;
  final String q1;
  final String q2;
  final String q3;

  QualifyingResult({
    required this.number,
    required this.position,
    required this.driver,
    required this.constructor,
    required this.q1,
    required this.q2,
    required this.q3,
  });

  factory QualifyingResult.fromJson(Map<String, dynamic> json) {
    return QualifyingResult(
      number: json['number'],
      position: json['position'],
      driver: Driver.fromJson(json['Driver']),
      constructor: Constructor.fromJson(json['Constructor']),
      q1: json['Q1'],
      q2: json['Q2'],
      q3: json['Q3'],
    );
  }

 QualifyingResultDto map(){
  return QualifyingResultDto(
    number: number, 
    position: position,
    driver: driver,
    constructor: constructor,
    q1: q1,
    q2: q2,
    q3: q3
    );
 }
}