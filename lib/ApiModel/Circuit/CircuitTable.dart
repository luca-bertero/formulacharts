import 'package:web_f1/ApiModel/Circuit/Circuit.dart';
import 'package:web_f1/Dto/CircuitDto/CircuitDto.dart';
import 'package:web_f1/Dto/CircuitDto/CircuitTableDto.dart';

class CircuitTable {
  final List<Circuit> circuits;

  CircuitTable({required this.circuits});

  factory CircuitTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> circuitList = json['Circuits'];
    List<Circuit> circuits = circuitList.map((e) => Circuit.fromJson(e)).toList();

    return CircuitTable(
      circuits: circuits,
    );
  }

  CircuitTableDto map(){
    List<CircuitDto> circuitList = circuits.map((i) => i.map()).toList();
    
    return CircuitTableDto(
      circuits: circuitList,
    );
  }
}
