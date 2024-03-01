import 'package:web_f1/Dto/RaceDto/PitStopDto.dart';

class PitStop {
  final String driverId;
  final String lap;
  final String stop;
  final String time;
  final String duration;

  PitStop({
    required this.driverId, 
    required this.lap,
    required this.stop,
    required this.time,
    required this.duration,
    });

  factory PitStop.fromJson(Map<String, dynamic> json) {
    return PitStop(
      driverId: json['driverId'], 
      lap: json['lap'],
      stop: json['stop'],
      time: json['time'],
      duration: json['duration'],
      );
  }

  PitStopDto map(){
    return PitStopDto(
      driverId: driverId,
      lap: lap,
      stop: stop,
      time: time,
      duration: duration
    );
  }
}