import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/notification.card.dart';

class NotificationNurseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text("Notificaciones",
                style: TextStyle(color: GlobalColors.textColor))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: <Widget>[
          NotificationCard(
            titulo: "Inicio de turno",
            descripcion: "Su turno de la mañana está por empezar",
            icono: Icons.alarm,
            colorFondoIcono: Colors.orange,
          ),
          NotificationCard(
            titulo: "Se generó su horario",
            descripcion: "El horario ha sido generado",
            icono: Icons.alarm,
            colorFondoIcono: GlobalColors.mainColor,
          )
        ],
      ),
    );
  }
}
