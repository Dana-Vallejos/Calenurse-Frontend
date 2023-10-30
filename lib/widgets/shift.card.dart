import 'package:flutter/material.dart';

class ShiftCard extends StatelessWidget {
  final String shiftName;
  final String shiftTime;

  ShiftCard({required this.shiftName, required this.shiftTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.access_time,
                  color: Colors.blue), // Un icono que representa un reloj
              SizedBox(width: 8),
              Text(shiftName),
            ],
          ),
          Text(shiftTime),
        ],
      ),
    );
  }
}
