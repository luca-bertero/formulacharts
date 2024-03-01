// need to override == and hashcode for a working provider with .family with an object as a parameter
class RaceInfo{
  final int year;
  final int race;

  RaceInfo({required this.year, required this.race});

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is RaceInfo &&
    runtimeType == other.runtimeType &&
    year == other.year &&
    race == other.race;

  @override
  int get hashCode => year.hashCode + race.hashCode;
}