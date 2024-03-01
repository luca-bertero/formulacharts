
import 'package:web_f1/ApiModel/Driver/Driver.dart';
import 'package:web_f1/Dto/DriverDto/DriverDto.dart';
import 'package:web_f1/Dto/DriverDto/DriverTableDto.dart';

class DriverTable {
  List<Driver> driver;

  DriverTable({
    required this.driver,
  });

  factory DriverTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> list = json['Drivers'];
    List<Driver> driverList = list.map((i) => Driver.fromJson(i)).toList();

    return DriverTable(
      driver: driverList,
    );
  }

  DriverTableDto map(){
    List<DriverDto> driverList = driver.map((i) => i.map()).toList();
    return DriverTableDto(
      driver: driverList,
    );
  }
}