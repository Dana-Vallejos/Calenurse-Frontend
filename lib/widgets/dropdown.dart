import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class DropDownButtonWidget extends StatelessWidget {
  const DropDownButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String _selected = "Enfermera";

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
          onChanged: (value) {},
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
}
