import 'package:web_f1/Dto/SeasonDto/SeasonDto.dart';

class Season {
  String season;
  String url;

  Season({
    required this.season,
    required this.url,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      season: json['season'],
      url: json['url'],
    );
  }

  SeasonDto map(){
    return SeasonDto(
      season: int.parse(season), 
      url: url);
  }
}