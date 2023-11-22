import 'package:flutter/material.dart';
import 'package:nssystem/screens/chief_nurse/cn.home.dart';
import 'package:nssystem/screens/chief_nurse/cn.homepage.screen.dart';
import 'package:nssystem/screens/chief_nurse/cn.profile.screen.dart';
import 'package:nssystem/screens/homepage.dart';
import 'package:nssystem/screens/nurse/n.home.dart';
import 'package:nssystem/services/services.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/dropdown.dart';
import 'package:nssystem/widgets/dynamic.dropdowm.dart';
import 'package:nssystem/widgets/email.form.field.dart';
import 'package:nssystem/widgets/text.form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  String _selectedRole = "Enfermera";
  String _selectedArea = "Ginecología";

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _registerUser() async {
    var response = await _apiService.registerUser(
      _nameController.text,
      _phoneController.text,
      _emailController.text,
      _passwordController.text,
      _selectedRole,
      _selectedArea,
    );

    if (response.statusCode == 200) {
      // Manejo de respuesta exitosa
      print('Registro exitoso');
    } else {
      // Manejo de error
      print('Error en el registro: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage('assets/images/calendurse1.png'),
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                //HELLO AGAIN
                Text(
                  'Registro',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //EMAIL TEXT
                TextFieldWidget(
                  labelText: 'Nombre',
                  hintText: 'Ingrese su nombre',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  labelText: 'Número Telefónico',
                  hintText: 'Ingresa tu número de teléfono',
                  obscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                //PASSWORD
                EmailFormField(
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  labelText: 'Crea una Contraseña',
                  hintText: 'Ingresa una contraseña segura',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownButtonWidget(
                  onSelected: (String newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdownButton(
                  options: [
                    "Ginecología",
                    "Pediatría",
                    "Oncología"
                  ], // Puedes actualizar esta lista dinámicamente
                  onSelected: (value) {
                    // Maneja la selección aquí
                    print("Seleccionaste: $value");
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                //SIGN IN BUTTON
                ButtonWidget(
                  text: 'Registrarse',
                  backgroundColor: GlobalColors.mainColor,
                  textColor: Colors.white,
                  onPressed: _registerUser,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya tienes una cuenta?',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton(
                      child: Text('Iniciar Sesión'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
