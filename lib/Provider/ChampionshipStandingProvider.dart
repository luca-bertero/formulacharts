import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:web_f1/Service/StandingService/IStandingService.dart';
import 'package:web_f1/Dto/StandingDto/DriverStandingsDto.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';

final standingProvider = FutureProvider.autoDispose.family<List<DriverStandingsDto>, RaceInfo>((ref, raceInfo) async {
  
  final standingController = Injector.appInstance.get<IStandingService>();
  final standing = await standingController.getDriverStandingBySeasonAndRound(raceInfo.year, raceInfo.race);
  return standing;
});
