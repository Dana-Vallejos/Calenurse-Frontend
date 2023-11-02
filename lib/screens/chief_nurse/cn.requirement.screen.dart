// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nssystem/screens/chief_nurse/cn.home.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/text.form.dart';

class RequirementTab extends StatelessWidget {
  const RequirementTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nº de enfermeras por turno',
              style: TextStyle(
                  color: GlobalColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Turno mañana",
              style: TextStyle(
                  color: GlobalColors.textColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFieldWidget(
              labelText: 'Número de Enfermeras',
              hintText: 'Ingrese número de enfermeras',
              obscureText: false,
            ),
            SizedBox(height: 20),
            Text(
              "Turno Tarde",
              style: TextStyle(
                  color: GlobalColors.textColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFieldWidget(
              labelText: 'Número de Enfermeras',
              hintText: 'Ingrese número de enfermeras',
              obscureText: false,
            ),
            SizedBox(height: 20),
            Text(
              "Turno Noche",
              style: TextStyle(
                  color: GlobalColors.textColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            TextFieldWidget(
              labelText: 'Número de Enfermeras',
              hintText: 'Ingrese número de enfermeras',
              obscureText: false,
            ),
            SizedBox(height: 50),
            Center(
              child: ButtonWidget(
                text: 'Generar Horario',
                backgroundColor: GlobalColors.mainColor,
                textColor: Colors.white,
                onPressed: (BuildContext context) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CNHomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
