import 'package:web_f1/Dto/MRDataDto.dart';
import 'package:web_f1/Dto/RaceDto/RaceTableDto.dart';

class MRDataRaceDto extends MRDataDto{

  RaceTableDto raceTable;

  MRDataRaceDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.raceTable,
  });

}