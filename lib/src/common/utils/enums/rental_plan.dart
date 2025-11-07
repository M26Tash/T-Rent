enum RentalPlan {
  hourly,
  daily,
  weekly,
}

RentalPlan rentalPlanFromString(String value) {
  return RentalPlan.values.firstWhere(
    (e) => e.name.toLowerCase() == value.toLowerCase(),
    orElse: () => RentalPlan.daily,
  );
}
