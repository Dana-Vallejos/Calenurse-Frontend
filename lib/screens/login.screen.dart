import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssystem/screens/chief_nurse/cn.home.dart';
import 'package:nssystem/screens/homepage.dart';
import 'package:nssystem/screens/nurse/n.home.dart';
import 'package:nssystem/screens/signup.screen.dart';
import 'package:nssystem/services/services.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/email.form.field.dart';
import 'package:nssystem/widgets/password.form.field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ApiService apiService = ApiService(); // Instancia de ApiService

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage('assets/images/calendurse1.png'),
                    width: 150,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //hELLO AGAIN
                  Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      color: GlobalColors.textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //eMAIL TEXT
                  EmailFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un email';
                      }
                      if (!value.contains('@')) {
                        return 'Por favor ingresa un email válido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //PASSWORD
                  PasswordFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa tu contraseña';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //SIGN IN BUTTON
                  ButtonWidget(
                    text: 'Iniciar Sesión',
                    backgroundColor: GlobalColors.mainColor,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Llamada al servicio de inicio de sesión
                        final response = await apiService.loginUser(
                          _emailController.text,
                          _passwordController.text,
                        );

                        if (response.statusCode == 200) {
                          // Si la respuesta es exitosa, navega a la siguiente pantalla
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CNHomeScreen(),
                          ));
                        } else if (response.statusCode == 401) {
                          // Si el usuario no está registrado o la contraseña es incorrecta
                          final snackBar = SnackBar(
                              content: Text(
                                  'Correo electrónico o contraseña incorrecta'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          // Para otros códigos de estado o errores
                          final snackBar = SnackBar(
                              content: Text('Error de inicio de sesión'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '¿No tienes cuenta?',
                        style: TextStyle(
                          color: GlobalColors.textColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                              color: GlobalColors.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
