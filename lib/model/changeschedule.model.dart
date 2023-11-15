class ChangeScheduleModel {
  final String name;
  final String lastName;
  final String previousShiftName;
  final String previousShift;
  final String newShiftName;
  final String newShift;
  final String substituteName;

  ChangeScheduleModel({
    required this.name,
    required this.lastName,
    required this.previousShiftName,
    required this.previousShift,
    required this.newShiftName,
    required this.newShift,
    required this.substituteName,
  });
  static List<ChangeScheduleModel> detailedRequests = [
    ChangeScheduleModel(
      name: "Alicia",
      lastName: "Rojas",
      previousShiftName: "Turno Noche",
      previousShift: "00:00 - 08:00",
      newShiftName: "Turno Tarde",
      newShift: "16:00 - 00:00",
      substituteName: "Eliana Torres",
    ),
    ChangeScheduleModel(
      name: "Julia",
      lastName: "Torres",
      previousShiftName: "Turno Noche",
      previousShift: "00:00 - 08:00",
      newShiftName: "Turno Mañana",
      newShift: "16:00 - 00:00",
      substituteName: "Eliana Torres",
    )
  ];
}
