import 'package:web_f1/Dto/MRDataDto.dart';
import 'package:web_f1/Dto/StatusDto/StatusTableDto.dart';

class MRDataStatusDto extends MRDataDto{

  StatusTableDto statusTable;

  MRDataStatusDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.statusTable,
  });

}