import 'package:web_f1/Dto/ConstructorDto/ConstructorDto.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/ResultDto/FastestLapDto.dart';
import 'package:web_f1/Dto/ResultDto/TimeDto.dart';

class ResultDto {
    int number;
    int position;
    String positionText;
    int points;
    DriverDto driver;
    ConstructorDto constructor;
    String grid;
    String laps;
    String status;
    TimeDto? time;
    FastestLapDto? fastestLap;

    ResultDto({
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

}