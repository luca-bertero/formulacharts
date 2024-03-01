import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:web_f1/Service/ResultService/IResultService.dart';
import 'package:web_f1/Dto/ResultDto/ResultDto.dart';
import 'package:web_f1/Dto/Utils/RaceInfo.dart';

final resultRaceProvider = FutureProvider.autoDispose.family<List<ResultDto>, RaceInfo>((ref, raceinfo) async {
   final IResultService raceRepo = Injector.appInstance.get<IResultService>();

   final response = await raceRepo.getRaceResult(raceinfo.year, raceinfo.race);

  return response;
});