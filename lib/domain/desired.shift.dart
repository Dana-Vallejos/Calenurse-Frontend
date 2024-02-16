import 'dart:convert';

class DesiredShift {
  final int id;
  final DateTime date;
  final int nurseId;
  final String shift;

  DesiredShift({
    required this.id,
    required this.date,
    required this.nurseId,
    required this.shift,
  });

  factory DesiredShift.fromJson(String str) =>
      DesiredShift.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  static List<DesiredShift> listFromJson(String json) {
    List<DesiredShift> desiredShifts = [];
    for (var desiredShift in jsonDecode(json)) {
      desiredShifts.add(DesiredShift.fromMap(desiredShift));
    }
    return desiredShifts;
  }

  factory DesiredShift.fromMap(Map<String, dynamic> json) => DesiredShift(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        nurseId: json["nurseId"],
        shift: json["shift"],
      );

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "date": date,
      "nurseId": nurseId,
      "shift": shift,
    };
  }
}
