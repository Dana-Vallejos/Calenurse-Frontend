import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const EmailFormField({
    Key? key,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GlobalColors.secondaryColor,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextFormField(
          controller: controller,
          decoration: const InputDecoration(
            border: InputBorder.none,
            labelText: 'Email',
            hintText: 'Ingrese su email',
            errorStyle: TextStyle(fontSize: 12),
            isDense: true,
          ),
          keyboardType: TextInputType.emailAddress,
          validator: validator ?? defaultEmailValidator,
        ),
      ),
    );
  }

  String? defaultEmailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa un email';
    }
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Por favor ingresa un email válido';
    }
    return null;
  }
}
