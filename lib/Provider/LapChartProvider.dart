import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:web_f1/Service/DriverService/IDriverService.dart';
import 'package:web_f1/Service/RaceService/IRaceService.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/RaceDto/LapsDto.dart';
import 'package:web_f1/Service/ResultService/IResultService.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';


final activityProvider = FutureProvider.autoDispose.family<Map<DriverDto,List<LapsDto>>, RaceInfo>((ref, raceInfo) async {
  final IRaceService raceRepo = Injector.appInstance.get<IRaceService>();

  final response = await raceRepo.getLapsBySeasonRoundAllDriverDto(raceInfo.year, raceInfo.race);

  return response;
});

final raceWinnerProvider = FutureProvider.autoDispose.family<DriverDto,RaceInfo>((ref, raceInfo) async {
    
  final IResultService resultRepo = Injector.appInstance.get<IResultService>();

  var racewinner =  await resultRepo.getRaceWinner(raceInfo.year, raceInfo.race);

  return racewinner;

});

final driversProvider = FutureProvider.autoDispose.family<List<DriverDto>,RaceInfo>((ref, raceInfo) async {
    
  final IDriverService driverRepo = Injector.appInstance.get<IDriverService>();

  var drivers =  await driverRepo.getDriversBySeasonAndRound(raceInfo.year, raceInfo.race);

  return drivers;

});


final raceNameProviderLap = FutureProvider.autoDispose.family<String, RaceInfo>((ref, raceInfo) async {

  final raceController = Injector.appInstance.get<IRaceService>();
  final raceNames = await raceController.getRaceNameBySeasonAndRound(raceInfo.year, raceInfo.race); 
  return raceNames;
});

final counterProvider = StateProvider.autoDispose((ref) => 90000.00);
final chooseFormatProvider = StateProvider.autoDispose((ref) => true);

class DriverNotifier extends Notifier<DriverDto?> {
  // We initialize the list of todos to an empty list
  @override
  DriverDto? build() {
    return null;
  }

  // Let's allow the UI to add todos.
  void addTodo(DriverDto driver) {
    // Since our state is immutable, we are not allowed to do `state.add(todo)`.
    // Instead, we should create a new list of todos which contains the previous
    // items and the new one.
    // Using Dart's spread operator here is helpful!
    state = driver;
    
    // No need to call "notifyListeners" or anything similar. Calling "state ="
    // will automatically rebuild the UI when necessary.
  }
}


final choosedDriver =  NotifierProvider<DriverNotifier, DriverDto?>(() {
  return DriverNotifier();
});
