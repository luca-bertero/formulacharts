import 'package:web_f1/ApiModel/Constructor/Constructor.dart';
import 'package:web_f1/Dto/ConstructorDto/ConstructorDto.dart';
import 'package:web_f1/Dto/ConstructorDto/ConstructorTableDto.dart';

class ConstructorTable {
  List<Constructor> constructors;

  ConstructorTable({
    required this.constructors,
  });

  factory ConstructorTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['Constructors'];
    List<Constructor> constructorList = list.map((i) => Constructor.fromJson(i)).toList();

    return ConstructorTable(
      constructors: constructorList,
    );
  }

  ConstructorTableDto map(){
    List<ConstructorDto> constructorList = constructors.map((i) => i.map()).toList();

    return ConstructorTableDto(constructors: constructorList);
  }
}