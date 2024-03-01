
import 'package:web_f1/Dto/MRDataDto.dart';
import 'package:web_f1/Dto/SeasonDto/SeasonTableDto.dart';

class MRDataSeasonsDto extends MRDataDto{

  SeasonTableDto seasonTable;

  MRDataSeasonsDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.seasonTable,
  });
}