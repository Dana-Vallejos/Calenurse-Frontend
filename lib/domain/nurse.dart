import 'dart:convert';
import 'dart:ffi';

import 'package:nssystem/domain/desired.shift.dart';
import 'package:nssystem/domain/user.dart';
import 'package:nssystem/domain/area.dart';

class Nurse {
  int id;
  String name;
  int age;
  String email;
  Bool isBoss;
  Area area;
  User user;
  final List<DesiredShift> desiredShifts;

  Nurse(
      {required this.id,
      required this.name,
      required this.age,
      required this.email,
      required this.isBoss,
      required this.area,
      required this.user,
      required this.desiredShifts});

  factory Nurse.fromJson(String str) => Nurse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nurse.fromMap(Map<String, dynamic> json) => Nurse(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        email: json["email"],
        isBoss: json["isBoss"],
        area: json["area"],
        user: json["user"],
        desiredShifts: List<DesiredShift>.from(
            json["desiredShifts"].map((x) => DesiredShift.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "age": age,
        "email": email,
        "isBoss": isBoss,
        "area": area,
        "user": user,
        "desiredShifts":
            List<dynamic>.from(desiredShifts.map((x) => x.toMap())),
      };
}
