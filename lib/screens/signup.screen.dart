import 'package:flutter/material.dart';
import 'package:nssystem/screens/chief_nurse/cn.home.dart';
import 'package:nssystem/screens/homepage.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/dropdown.dart';
import 'package:nssystem/widgets/text.form.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  width: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                //hELLO AGAIN
                Text(
                  'Registro',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //eMAIL TEXT
                TextFormWidget(
                  text: 'Nombre',
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormWidget(
                  text: 'Apellido',
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                //PASSWORD
                TextFormWidget(
                  text: 'Email',
                  obscure: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormWidget(
                  text: 'Password',
                  obscure: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                DropDownButtonWidget(),
                const SizedBox(
                  height: 30,
                ),
                //SIGN IN BUTTOJ
                ButtonWidget(
                  text: 'Iniciar Sesión',
                  backgroundColor: GlobalColors.mainColor,
                  textColor: Colors.white,
                  onPressed: (BuildContext context) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
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
                //REGISTER NOW
              ],
            ),
          ),
        ),
      ),
    );
  }
}
