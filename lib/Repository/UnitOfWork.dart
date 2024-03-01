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
import 'package:web_f1/Repository/Abstraction/IUnitOfWork.dart';
import 'package:web_f1/Repository/Repository.dart';


class UnitOfWork implements IUnitOfWork{

  @override
  IRepository<MRDataDrivers, MRDataDriversDto> get driversRepository
    => Repository<MRDataDrivers, MRDataDriversDto>();

  @override
  IRepository<MRDataRace, MRDataRaceDto> get racesRepository
    => Repository<MRDataRace, MRDataRaceDto>();

  @override
  IRepository<MRDataCircuits, MRDataCircuitsDto> get circuitsRepository
    => Repository<MRDataCircuits, MRDataCircuitsDto>();

  @override
  IRepository<MRDataStanding, MRDataStandingDto> get standingsRepository
    => Repository<MRDataStanding, MRDataStandingDto>();
    
  @override
  IRepository<MRDataResult, MRDataResultDto> get resultsRepository 
    => Repository<MRDataResult, MRDataResultDto>();
}