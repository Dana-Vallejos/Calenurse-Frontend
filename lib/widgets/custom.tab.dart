import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  CustomTab({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: GlobalColors.mainColor,
        ),
      ),
    );
  }
}
