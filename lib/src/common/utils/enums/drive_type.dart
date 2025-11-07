enum DriveType {
  awd,
  rwd,
  fwd,
}

DriveType driveTypeFromString(String value) {
  return DriveType.values.firstWhere(
    (e) => e.name.toLowerCase() == value.toLowerCase(),
    orElse: () => DriveType.awd,
  );
}

extension DriveTypeExtension on DriveType {
  String toShortString() => name;

  String toDisplayString() {
    switch (this) {
      case DriveType.fwd:
        return 'FWD';
      case DriveType.rwd:
        return 'RWD';
      case DriveType.awd:
        return 'AWD';
    }
  }
}
