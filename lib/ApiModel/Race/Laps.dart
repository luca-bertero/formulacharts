import 'package:web_f1/ApiModel/Race/Timing.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Dto/RaceDto/TimingDto.dart';

class Laps {
  final String number;
  final List<Timing> timings;

  Laps({required this.number, required this.timings});

  factory Laps.fromJson(Map<String, dynamic> json) {
    List<dynamic> timingsList = json['Timings'];
    List<Timing> timings =
        timingsList.map((timing) => Timing.fromJson(timing)).toList();

    return Laps(number: json['number'], timings: timings);
  }

  LapsDto map(){
    List<TimingDto> timingList = timings.map((i) => i.map()).toList();
    return LapsDto(
      number: int.parse(number), 
      timings: timingList,
    );
  }
}