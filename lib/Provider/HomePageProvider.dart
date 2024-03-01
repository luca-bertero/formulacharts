import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:web_f1/Service/RaceService/IRaceService.dart';
import 'package:web_f1/Dto/RaceDto/RaceDto.dart';

final yearProvider = Provider((ref) {
  final List<int> yearList = List.empty(growable: true);
  for(var i = DateTime.now().year; i >= 1950; i--){
    yearList.add(i);
  }
  return yearList;
});


final raceNameProvider = FutureProvider.autoDispose.family<List<RaceDto>, int>((ref, season) async {
  if (season == 0) {
    // You could return an empty list or handle this case appropriately.
    return [];
  }
  final raceController = Injector.appInstance.get<IRaceService>();
  final raceNames = await raceController.getRaceBySeason(season);
  return raceNames;
});

final yearChoosedProvider = StateProvider((ref) => 0);
final yearSelectedProvider = StateProvider((ref) => false);
final buttonActiveProvider = StateProvider((ref) => false);
final raceNameChoosedProvider = StateProvider((ref) => 0);
