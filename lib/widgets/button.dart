import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Function onPressed;
  final double borderRadius;

  ButtonWidget({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: TextStyle(color: textColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: () => onPressed(context),
        child: Text(text),
      ),
    );
  }
}
