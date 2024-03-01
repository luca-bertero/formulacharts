import 'package:web_f1/Dto/DriverDto/DriverDto.dart';

class Driver {
  String driverId;
  String url;
  String givenName;
  String familyName;
  String dateOfBirth;
  String nationality;

  Driver({
    required this.driverId,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      driverId: json['driverId'],
      url: json['url'],
      givenName: json['givenName'],
      familyName: json['familyName'],
      dateOfBirth: json['dateOfBirth'],
      nationality: json['nationality'],
    );
  }
 
  DriverDto map(){
    return DriverDto(
      driverId: driverId, 
      url: url, 
      givenName: givenName, 
      familyName: familyName, 
      dateOfBirth: dateOfBirth, 
      nationality: nationality);
  }
}