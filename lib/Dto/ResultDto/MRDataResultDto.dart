import 'package:web_f1/Dto/MRDataDto.dart';
import 'package:web_f1/Dto/ResultDto/ResultTableDto.dart';

class MRDataResultDto extends MRDataDto{

  ResultTableDto resultTable;

  MRDataResultDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.resultTable,
  });

}