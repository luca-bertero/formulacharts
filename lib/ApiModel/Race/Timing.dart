  import 'package:web_f1/Dto/RaceDto/TimingDto.dart';

class Timing {
  final String driverId;
  final String position;
  final String time;

  Timing({required this.driverId, required this.position, required this.time});

  factory Timing.fromJson(Map<String, dynamic> json) {
    return Timing(
      driverId: json['driverId'],
      position: json['position'],
      time: json['time'],
    );
  }

  TimingDto map(){
    return TimingDto(
      driverId: driverId,
      position: int.parse(position),
      time: time,
    );
  }
}