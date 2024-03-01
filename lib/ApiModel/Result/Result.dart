import 'package:web_f1/ApiModel/Constructor/Constructor.dart';
import 'package:web_f1/ApiModel/Driver/Driver.dart';
import 'package:web_f1/ApiModel/Result/FastestLap.dart';
import 'package:web_f1/ApiModel/Result/Time.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';

class Result {
    String number;
    String position;
    String positionText;
    String points;
    Driver driver;
    Constructor constructor;
    String grid;
    String laps;
    String status;
    Time? time;
    FastestLap? fastestLap;

    Result({
        required this.number,
        required this.position,
        required this.positionText,
        required this.points,
        required this.driver,
        required this.constructor,
        required this.grid,
        required this.laps,
        required this.status,
        this.time,
        this.fastestLap,
    });

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      number: json["number"],
      position: json["position"],
      positionText: json["positionText"],
      points: json["points"],
      driver: Driver.fromJson(json["Driver"]),
      constructor: Constructor.fromJson(json["Constructor"]),
      grid: json["grid"],
      laps: json["laps"],
      status:json["status"],
      time: Time.fromJson(json["Time"]),
      fastestLap: FastestLap.fromJson(json["FastestLap"]),
    );
  }

  ResultDto map(){
    return ResultDto(
      number: int.parse(number),
      position: int.parse(position),
      positionText: positionText,
      points: int.parse(points),
      driver: driver.map(),
      constructor: constructor.map(),
      grid: grid,
      laps: laps,
      status: status,
      time: time?.map(),
      fastestLap: fastestLap?.map(),
    );
  }
}