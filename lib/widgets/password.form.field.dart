import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';

class PasswordFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordFormField({
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
            labelText: 'Contraseña',
            hintText: 'Ingrese su contraseña',
            errorStyle: TextStyle(fontSize: 12),
            isDense: true,
          ),
          obscureText: true,
          validator: validator ?? defaultPasswordValidator,
        ),
      ),
    );
  }

  String? defaultPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa una contraseña';
    }
    if (value.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres';
    }
    String pattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\$@\$!%*?&])[A-Za-z\d\$@\$!%*?&]{8,}';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'La contraseña debe contener letras, números y caracteres especiales';
    }
    return null;
  }
}
