import 'package:web_f1/ApiModel/Circuit/MRDataCircuit.dart';
import 'package:web_f1/ApiModel/Driver/MRDataDrivers.dart';
import 'package:web_f1/ApiModel/Race/MRDataRace.dart';
import 'package:web_f1/ApiModel/Result/MRDataResult.dart';
import 'package:web_f1/ApiModel/Standing/MRDataStanding.dart';
import 'package:web_f1/Dto/CircuitDto/MRDataCircuitsDto.dart';
import 'package:web_f1/Dto/DriverDto/MRDataDriversDto.dart';
import 'package:web_f1/Dto/RaceDto/MRDataRaceDto.dart';
import 'package:web_f1/Dto/ResultDto/MRDataResultDto.dart';
import 'package:web_f1/Dto/StandingDto/MRDataStandingDto.dart';
import 'package:web_f1/Repository/Abstraction/IRepository.dart';

abstract interface class IUnitOfWork{

  IRepository<MRDataDrivers, MRDataDriversDto> get driversRepository;
  IRepository<MRDataRace, MRDataRaceDto> get racesRepository;
  IRepository<MRDataResult, MRDataResultDto> get resultsRepository;
  IRepository<MRDataCircuits, MRDataCircuitsDto> get circuitsRepository;
  IRepository<MRDataStanding, MRDataStandingDto> get standingsRepository;
}