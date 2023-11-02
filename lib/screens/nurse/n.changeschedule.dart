import 'package:flutter/material.dart';

import 'package:nssystem/screens/chief_nurse/cn.home.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/field.dart';
import 'package:nssystem/widgets/shifcard.edit.dart';

class ChangeScheduleNurse extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height *
          0.9, // Ajusta este valor según la altura que desees
      margin: EdgeInsets.only(top: 70.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        color: GlobalColors.backgroundColor,
      ),
      child: Scaffold(
        backgroundColor: GlobalColors.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            'Turnos',
            style: TextStyle(
                color: GlobalColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, bottom: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildField("Nombre", 'Katerin Villalobos'),
              const SizedBox(height: 20),

              Text(
                "Nuevo Turno",
                style: TextStyle(
                    color: GlobalColors.textColor, fontWeight: FontWeight.bold),
              ),
              ShiftCardEdit(
                  shiftName: "Vanessa",
                  shiftTime: "13:00 - 19:00"),
              const SizedBox(height: 20),
              buildField("Suplente", 'Isabel '),
              const Spacer(),
              ButtonWidget(
                text: 'Rechazar Solicitud',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: (BuildContext context) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              SizedBox(height: 20),
              ButtonWidget(
                text: 'Aceptar Solicitud',
                backgroundColor: GlobalColors.mainColor,
                textColor: Colors.white,
                onPressed: (BuildContext context) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ],

          ),
        ),
      ),
    );
  }
}
