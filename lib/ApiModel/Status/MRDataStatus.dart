import 'package:web_f1/ApiModel/MRdata.dart';
import 'package:web_f1/ApiModel/Status/StatusTable.dart';

class MRDataStatus extends MRData{

  StatusTable statusTable;

  MRDataStatus({
    required super.xmlns,
    required super.series,
    required super.url,
    required super.limit,
    required super.offset,
    required super.total,
    required this.statusTable,
  });

  factory MRDataStatus.fromJson(Map<String, dynamic> json) {
    return MRDataStatus(
      xmlns: json['MRData']['xmlns'],
      series: json['MRData']['series'],
      url: json['MRData']['url'],
      limit: json['MRData']['limit'],
      offset: json['MRData']['offset'],
      total: json['MRData']['total'],
      statusTable: StatusTable.fromJson(json['MRData']['StatusTable']),
    );
  }
}