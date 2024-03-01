import 'package:web_f1/Dto/CircuitDto/LocationDto.dart';

class CircuitDto {
  final String circuitId;
  final String url;
  final String circuitName;
  final LocationDto location;

  CircuitDto(
      {required this.circuitId,
      required this.url,
      required this.circuitName,
      required this.location});
}
