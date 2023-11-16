import 'package:flutter/material.dart';
import 'package:nssystem/model/card.tarde.model.dart';
import 'package:nssystem/utils/global.colors.dart';

class CardTarde extends StatelessWidget {
  const CardTarde({super.key});

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
        children: cardtarde.map((tarde) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              tarde.name + " " + tarde.lastName,
              style: TextStyle(
                  color: GlobalColors.textColor, fontWeight: FontWeight.w500),
            ),
          );
        }).toList(),
      ),
    );
  }
}
