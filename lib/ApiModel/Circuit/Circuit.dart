import 'package:web_f1/ApiModel/Circuit/Location.dart';
import 'package:web_f1/Dto/CircuitDto/CircuitDto.dart';

class Circuit {
  final String circuitId;
  final String url;
  final String circuitName;
  final Location location;

  Circuit(
      {required this.circuitId,
      required this.url,
      required this.circuitName,
      required this.location});

  factory Circuit.fromJson(Map<String, dynamic> json) {
    return Circuit(
      circuitId: json['circuitId'],
      url: json['url'],
      circuitName: json['circuitName'],
      location: Location.fromJson(json['Location']),
    );
  }

  CircuitDto map(){
    return CircuitDto(
      circuitId: circuitId, 
      url: url, 
      circuitName: circuitName, 
      location: location.map(),
      );
  }
}
