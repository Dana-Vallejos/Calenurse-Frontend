// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nssystem/screens/login.screen.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/field.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text("Perfil", style: TextStyle(color: Colors.black))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Image(
                  image: AssetImage('assets/images/Frame.png'),
                  width: 120,
                ),
              ),
              const SizedBox(height: 10),
              buildField("Nombre", "Lucía"),
              const SizedBox(height: 15),
              buildField("Apellido", "Torres"),
              const SizedBox(height: 15),
              buildField("Hospital", "Auna"),
              const SizedBox(height: 15),
              buildField("Área", "Oncología"),
              const SizedBox(height: 50),
              ButtonWidget(
                text: 'Cambiar Contraseña',
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: (BuildContext context) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              SizedBox(height: 10),
              ButtonWidget(
                text: 'Cerrar Sesión',
                backgroundColor: GlobalColors.mainColor,
                textColor: Colors.white,
                onPressed: (BuildContext context) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
