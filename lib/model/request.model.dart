class RequestModel {
  final String name;
  final String lastName;
  final String previousShiftName;
  final String previousShift;
  final String newShiftName;
  final String newShift;
  final String substituteName;

  RequestModel({
    required this.name,
    required this.lastName,
    required this.previousShiftName,
    required this.previousShift,
    required this.newShiftName,
    required this.newShift,
    required this.substituteName,
  });
  static List<RequestModel> detailedRequests = [
    RequestModel(
      name: "Alicia",
      lastName: "Rojas",
      previousShiftName: "Turno Noche",
      previousShift: "00:00 - 08:00",
      newShiftName: "Turno Tarde",
      newShift: "16:00 - 00:00",
      substituteName: "Eliana Torres",
    ),
    RequestModel(
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
