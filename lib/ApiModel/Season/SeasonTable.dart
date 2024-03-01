import 'package:web_f1/Dto/SeasonDto/SeasonDto.dart';
import 'package:web_f1/Dto/SeasonDto/SeasonTableDto.dart';

import 'Season.dart';

class SeasonTable {
  List<Season> seasons;

  SeasonTable({
    required this.seasons,
  });

  factory SeasonTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['Seasons'];
    List<Season> seasonList = list.map((i) => Season.fromJson(i)).toList();

    return SeasonTable(
      seasons: seasonList,
    );
  }

  SeasonTableDto map() {
    List<SeasonDto> seasonList = seasons.map((i) => i.map()).toList();
    return SeasonTableDto(
      seasons: seasonList,
      );
  }
}