import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class DropDownButtonWidget extends StatefulWidget {
  final Function(String) onSelected;
  const DropDownButtonWidget({super.key, required this.onSelected});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {
  String _selected = "Enfermera";

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: GlobalColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: DropdownButton(
          dropdownColor: GlobalColors.secondaryColor,
          value: _selected,
          items: const [
            DropdownMenuItem(
              child: Text("Enfermera"),
              value: "Enfermera",
            ),
            DropdownMenuItem(
              child: Text("Jefa de Enfermeras"),
              value: "Jefa de Enfermeras",
            )
          ],
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                _selected = newValue;
              });
              widget.onSelected(newValue);
            }
          },
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
}
