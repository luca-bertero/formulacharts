import 'package:web_f1/ApiModel/Constructor/Constructor.dart';
import 'package:web_f1/ApiModel/Driver/Driver.dart';

class QualifyingResultDto {
  final String number;
  final String position;
  final Driver driver;
  final Constructor constructor;
  final String q1;
  final String q2;
  final String q3;

  QualifyingResultDto({
    required this.number,
    required this.position,
    required this.driver,
    required this.constructor,
    required this.q1,
    required this.q2,
    required this.q3,
  });
}