import 'package:web_f1/Dto/MRDataDto.dart';
import 'package:web_f1/Dto/StandingDto/StandingTableDto.dart';

class MRDataStandingDto extends MRDataDto{

  StandingsTableDto standingTable;

  MRDataStandingDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.standingTable,
  });
}