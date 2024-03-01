import 'package:web_f1/Dto/ConstructorDto/ConstructorTableDto.dart';
import 'package:web_f1/Dto/MRDataDto.dart';

class MRDataConstructorDto extends MRDataDto{

  ConstructorTableDto constructorTable;

  MRDataConstructorDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.constructorTable,
  });

}