import 'package:web_f1/Utils/converter.dart';

class TimingDto {
  final String driverId;
  final int position;
  final String time;
  int get numericTime => Converter.convertToNumber(time);
  int? b;

  TimingDto({required this.driverId, required this.position, required this.time});
}