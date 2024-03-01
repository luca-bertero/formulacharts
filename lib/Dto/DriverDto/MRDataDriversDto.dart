import 'package:web_f1/Dto/DriverDto/DriverTableDto.dart';
import 'package:web_f1/Dto/MRDataDto.dart';

class MRDataDriversDto extends MRDataDto{

  DriverTableDto driverTable;

  MRDataDriversDto({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.driverTable,
  });
}