import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

Widget buildField(String label, String value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(label,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: GlobalColors.textColor)),
      TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          filled: true,
          fillColor: GlobalColors.secondaryColor,
        ),
        readOnly: true, // Si quieres que sea editable, elimina esta línea.
      ),
    ],
  );
}
