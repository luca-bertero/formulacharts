import 'package:web_f1/Dto/ResultDto/AverageSpeedDto.dart';

class AverageSpeed {
    final String? units;
    final String? speed;

    AverageSpeed({
        this.units,
        this.speed,
    });

factory AverageSpeed.fromJson(Map<String, dynamic>? json){
    return json != null ? AverageSpeed(
      units: json["units"],
      speed: json["speed"],
    ) : AverageSpeed();
  }

  AverageSpeedDto map(){
    return AverageSpeedDto(
      units: units,
      speed: speed,
    );
  }
}