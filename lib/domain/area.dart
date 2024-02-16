import 'dart:convert';

import 'nurse.dart';

class Area {
  final int id;
  final String name;
  Nurse nurses;

  Area({
    this.id = 0,
    required this.name,
    required this.nurses,
  });

  factory Area.fromJson(String str) => Area.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Area.fromMap(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        nurses: json["nurses"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "nurses": nurses,
      };
}
