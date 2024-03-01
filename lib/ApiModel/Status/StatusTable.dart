import 'package:web_f1/ApiModel/Status/Status.dart';

class StatusTable {
  List<Status> status;

  StatusTable({required this.status});

  factory StatusTable.fromJson(Map<String, dynamic> json) {
    List<dynamic> statusList = json['Status'];
    List<Status> status = statusList.map((e) => Status.fromJson(e)).toList();
    
    return StatusTable(
      status: status
    );
  }
}