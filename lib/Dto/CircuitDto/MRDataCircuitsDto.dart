import 'package:web_f1/Dto/CircuitDto/CircuitTableDto.dart';
import 'package:web_f1/Dto/MRDataDto.dart';

class MRDataCircuitsDto extends MRDataDto{

  CircuitTableDto circuitTable;

  MRDataCircuitsDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.circuitTable,
  });
}