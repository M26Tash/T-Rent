enum FuelType {
  petrol,
  diesel,
  electric,
  hybrid,
}

FuelType fuelTypeFromString(String value) {
  return FuelType.values.firstWhere(
    (e) => e.name.toLowerCase() == value.toLowerCase(),
    orElse: () => FuelType.petrol,
  );
}
