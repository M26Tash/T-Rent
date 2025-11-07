enum TransmissionType {
  automatic,
  manual,
}

TransmissionType transmissionTypeFromString(String value) {
  return TransmissionType.values.firstWhere(
    (e) => e.name.toLowerCase() == value.toLowerCase(),
    orElse: () => TransmissionType.automatic,
  );
}
