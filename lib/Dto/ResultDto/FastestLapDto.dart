import 'package:web_f1/Dto/ResultDto/AverageSpeedDto.dart';
import 'package:web_f1/Dto/ResultDto/TimeDto.dart';

class FastestLapDto {
    final String? rank;
    final String? lap;
    final TimeDto? time;
    final AverageSpeedDto? averageSpeed;

    FastestLapDto({
        this.rank,
        this.lap,
        this.time,
        this.averageSpeed,
    });

}