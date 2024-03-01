import 'package:web_f1/Dto/CircuitDto/LocationDto.dart';

class Location {
  final String lat;
  final String long;
  final String locality;
  final String country;

  Location(
      {required this.lat,
      required this.long,
      required this.locality,
      required this.country});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      long: json['long'],
      locality: json['locality'],
      country: json['country'],
    );
  }

  LocationDto map(){
    return LocationDto(
      lat: lat,
      long: long,
      locality: locality,
      country: country
    );
  }
}
