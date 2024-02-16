import 'dart:convert';

import 'package:nssystem/domain/nurse.dart';

class GeneratedShift {
  final int id;
  Nurse nurse;
  DateTime date;
  String shift;

  GeneratedShift(
      {this.id = 0,
      required this.nurse,
      required this.date,
      required this.shift});

  factory GeneratedShift.fromJson(String str) =>
      GeneratedShift.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GeneratedShift.fromMap(Map<String, dynamic> json) => GeneratedShift(
      id: json["id"],
      nurse: Nurse.fromMap(json["nurse"]),
      date: DateTime.parse(json["date"]),
      shift: json["shift"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "nurse": nurse,
        "date": date,
        "shift": shift,
      };
}
