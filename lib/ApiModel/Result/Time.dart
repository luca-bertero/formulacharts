import 'package:web_f1/Dto/ResultDto/TimeDto.dart';

class Time {
    String? millis;
    String? time;

    Time({
        this.millis,
        this.time,
    });

  factory Time.fromJson(Map<String, dynamic>? json){
    return json != null ? Time(
      millis: json["millis"],
      time: json["time"],
    ) : Time();
  }

  TimeDto map(){
    return TimeDto(
      millis: millis,
      time: time
    );
  }
}