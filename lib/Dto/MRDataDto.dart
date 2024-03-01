abstract class MRDataDto {
  String xmlns;
  String series;
  String url;
  int limit;
  int offset;
  int total;

  MRDataDto({
    required this.xmlns,
    required this.series,
    required this.url,
    required this.limit,
    required this.offset,
    required this.total,
  });
}