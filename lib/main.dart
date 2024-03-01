import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injector/injector.dart';
import 'package:web_f1/Service/DriverService/DriverService.dart';
import 'package:web_f1/Service/DriverService/IDriverService.dart';
import 'package:web_f1/Service/RaceService/IRaceService.dart';
import 'package:web_f1/Service/RaceService/RaceService.dart';
import 'package:web_f1/Service/ResultService/IResultService.dart';
import 'package:web_f1/Service/ResultService/ResultService.dart';
import 'package:web_f1/Service/StandingService/IStandingService.dart';
import 'package:web_f1/Service/StandingService/StandingService.dart';
import 'package:web_f1/Repository/Abstraction/IUnitOfWork.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:web_f1/Repository/UnitOfWork.dart';
import 'package:web_f1/RestApiCaller/RestApiCaller.dart';
import 'package:web_f1/Router/router.dart' as Routers;

void main() {
    
  usePathUrlStrategy();

  registerDependency();
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Formula 1 Chart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      routerConfig: Routers.Router.route,
    );
  }
}

void registerDependency(){
  final injector = Injector.appInstance;

  injector.registerSingleton<RestApiCaller>(() => RestApiCaller());

  injector.registerDependency<IUnitOfWork>(() => UnitOfWork());

  injector.registerDependency<IDriverService>(() {
    final unitOfWork = injector.get<IUnitOfWork>();
    return DriverService(unitOfWork: unitOfWork);
  });

  injector.registerDependency<IRaceService>(() {
    final unitOfWork = injector.get<IUnitOfWork>();
    return RaceService(unitOfWork: unitOfWork);
  });

  injector.registerDependency<IResultService>(() {
    final unitOfWork = injector.get<IUnitOfWork>();
    return ResultService(unitOfWork: unitOfWork);
  });

  injector.registerDependency<IStandingService>(() {
    final unitOfWork = injector.get<IUnitOfWork>();
    return StandingService(unitOfWork: unitOfWork);
  });
}