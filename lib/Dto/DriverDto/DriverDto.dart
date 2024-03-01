class DriverDto {
  String driverId;
  String url;
  String givenName;
  String familyName;
  String dateOfBirth;
  String nationality;
  DriverDto({
    required this.driverId,
    required this.url,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is DriverDto &&
    runtimeType == other.runtimeType &&
    driverId == other.driverId &&
    url == other.url &&
    givenName == other.givenName &&
    familyName == other.familyName &&
    dateOfBirth == other.dateOfBirth &&
    nationality == other.nationality;

  @override
  int get hashCode => driverId.hashCode + url.hashCode + givenName.hashCode + familyName.hashCode + dateOfBirth.hashCode + nationality.hashCode;
}