import 'package:flutter/material.dart';
import 'package:nssystem/model/card.manana.model.dart';
import 'package:nssystem/utils/global.colors.dart';

class CardManana extends StatelessWidget {
  const CardManana({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: GlobalColors.secondaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cardmanana.map((manana) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              manana.name + " " + manana.lastName,
              style: TextStyle(
                  color: GlobalColors.textColor, fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    );
  }
}
