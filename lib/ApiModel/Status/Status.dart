import 'package:web_f1/Dto/StatusDto/StatusDto.dart';

class Status {
  String statusId;
  String count;
  String status;

  Status({required this.statusId, required this.count, required this.status});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
    statusId: json['statusId'],
    count: json['count'],
    status: json['status'],
    );
  }

  StatusDto map(){
    return StatusDto(
      statusId: statusId,
      count: count,
      status: status,
    );
  }
}