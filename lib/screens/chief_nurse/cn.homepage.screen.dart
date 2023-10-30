import 'package:flutter/material.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/card.turno.manana.dart';

class HomepageCN extends StatefulWidget {
  const HomepageCN({super.key});

  @override
  State<HomepageCN> createState() => _HomepagCNState();
}

class _HomepagCNState extends State<HomepageCN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hola",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            Text(
              "Veamos el horario de hoy",
              style: TextStyle(color: GlobalColors.mainColor, fontSize: 20),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        children: [
          Text(
            "Horario",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: GlobalColors.textColor,
                fontSize: 24),
          ),
          const SizedBox(height: 10),
          Text(
            "Turno Manaña (08:00-16:00)",
            style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CardManana(),
          const SizedBox(height: 10),
          Text(
            "Turno Tarde (16:00-00:00)",
            style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CardManana(),
          const SizedBox(height: 10),
          Text(
            "Turno Noche (00:00-08:00)",
            style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CardManana(),
        ],
      ),
    );
  }
}
