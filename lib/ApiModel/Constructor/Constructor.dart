import 'package:web_f1/Dto/ConstructorDto/ConstructorDto.dart';

class Constructor {
  String constructorId;
  String url;
  String name;
  String nationality;

  Constructor({
    required this.constructorId,
    required this.url,
    required this.name,
    required this.nationality,
  });

  factory Constructor.fromJson(Map<String, dynamic> json) {
    return Constructor(
      constructorId: json['constructorId'],
      url: json['url'],
      name: json['name'],
      nationality: json['nationality'],
    );
  }

  ConstructorDto map(){
    return ConstructorDto(
      constructorId: constructorId,
      url: url,
      name: name,
      nationality: nationality,
    );    
  }
}