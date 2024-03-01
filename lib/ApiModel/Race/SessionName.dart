import 'package:web_f1/Dto/RaceDto/SessionNameDto.dart';

class FirstPractice{
  final String? date;
  final String? time;

  FirstPractice({
     this.date, 
     this.time,
    });

  factory FirstPractice.fromJson(Map<String, dynamic>? json) {
    return json != null ? FirstPractice(
      date: json['date'], 
      time: json['time'],
      ) : FirstPractice();
  }

  FirstPracticeDto map(){
    return FirstPracticeDto(
      date: date,
      time: time);
  }
}

class SecondPractice{
  final String? date;
  final String? time;

  SecondPractice({
    this.date, 
    this.time,
    });

  factory SecondPractice.fromJson(Map<String, dynamic>? json) {
    return json != null ? SecondPractice(
      date: json['date'], 
      time: json['time'],
      ) : SecondPractice();
  }

  SecondPracticeDto map(){
    return SecondPracticeDto(
      date: date,
      time: time);
  }
}

class ThirdPractice{
  final String? date;
  final String? time;

  ThirdPractice({
    this.date, 
    this.time,
    });

  factory ThirdPractice.fromJson(Map<String, dynamic>? json) {
    return json != null ? ThirdPractice(
      date: json['date'], 
      time: json['time'],
      ) : ThirdPractice();
  }

  ThirdPracticeDto map(){
    return ThirdPracticeDto(
      date: date,
      time: time);
  }
}

class Qualifying{
  final String? date;
  final String? time;

  Qualifying({
     this.date, 
     this.time,
    });

  factory Qualifying.fromJson(Map<String, dynamic>? json) {
    return json != null ? Qualifying(
      date: json['date'], 
      time: json['time'],
      ) : Qualifying();
  }

  QualifyingDto map(){
    return QualifyingDto(
      date: date,
      time: time);
  }
}

class Sprint{
  final String? date;
  final String? time;

  Sprint({
    this.date, 
    this.time,
    });

  factory Sprint.fromJson(Map<String, dynamic>? json) {
    return json != null ? Sprint(
      date: json['date'], 
      time: json['time'],
      ) : Sprint();
  }

  SprintDto map(){
    return SprintDto(
      date: date,
      time: time);
  }
}