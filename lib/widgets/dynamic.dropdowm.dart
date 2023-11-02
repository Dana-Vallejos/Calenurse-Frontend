import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class CustomDropdownButton extends StatefulWidget {
  final List<String> options;
  final Function(String) onSelected;

  const CustomDropdownButton({
    Key? key,
    required this.options,
    required this.onSelected,
  }) : super(key: key);

  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String? selectedOption = "Ginecología";

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: GlobalColors.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: DropdownButton<String>(
          dropdownColor: GlobalColors.secondaryColor,
          value: selectedOption,
          items: widget.options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
            widget.onSelected(newValue!);
          },
          isExpanded: true,
          underline: Container(),
        ),
      ),
    );
  }
}
