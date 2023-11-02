import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class ShiftCard extends StatelessWidget {
  final String shiftName;
  final String shiftTime;

  ShiftCard({required this.shiftName, required this.shiftTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: GlobalColors.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.access_time,
                  color: Colors.blue), // Un icono que representa un reloj
              SizedBox(width: 8),
              Column(
                children: [
                  Text(shiftName),
                  Text(shiftTime),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
