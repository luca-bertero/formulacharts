import 'package:web_f1/ApiModel/Result/AverageSpeed.dart';
import 'package:web_f1/ApiModel/Result/Time.dart';
import 'package:web_f1/Dto/ResultDto/FastestLapDto.dart';

class FastestLap {
    final String? rank;
    final String? lap;
    final Time? time;
    final AverageSpeed? averageSpeed;

    FastestLap({
        this.rank,
        this.lap,
        this.time,
        this.averageSpeed,
    });

    factory FastestLap.fromJson(Map<String, dynamic>? json){
    return json != null ? FastestLap(
      rank: json["rank"],
      lap: json["lap"],
      time: Time.fromJson(json["time"]),
      averageSpeed: AverageSpeed.fromJson(json["averageSpeed"]),
    ) : FastestLap();
  }
  
  FastestLapDto map(){
    return FastestLapDto(
      rank: rank,
      lap: lap,
      time: time?.map(),
      averageSpeed: averageSpeed?.map(),
    );
  }

}