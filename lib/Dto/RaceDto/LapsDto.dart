import 'package:web_f1/Dto/RaceDto/TimingDto.dart';

class LapsDto {
  final int number;
  final List<TimingDto> timings;

  LapsDto({required this.number, required this.timings});
}