import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class NotificationCard extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final IconData icono;
  final Color colorFondoIcono;

  NotificationCard({
    required this.titulo,
    required this.descripcion,
    required this.icono,
    required this.colorFondoIcono,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        // Agregado para bordes redondeados
        borderRadius: BorderRadius.circular(12),
      ),
      color: GlobalColors.secondaryColor,
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colorFondoIcono,
          child: Icon(
            icono,
            color: Colors.white,
          ),
        ),
        title: Text(
          titulo,
          style: TextStyle(
              fontWeight: FontWeight.w500, color: GlobalColors.textColor),
        ),
        subtitle: Text(
          descripcion,
          style: TextStyle(color: GlobalColors.textColor2, fontSize: 13),
        ),
      ),
    );
  }
}
