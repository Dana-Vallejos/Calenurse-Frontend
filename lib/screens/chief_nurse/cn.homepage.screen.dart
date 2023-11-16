import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/card.turno.manana.dart';
import 'package:nssystem/widgets/card.turno.noche.dart';
import 'package:nssystem/widgets/card.turno.tarde.dart';

class HomepageCN extends StatefulWidget {
  const HomepageCN({super.key});

  @override
  State<HomepageCN> createState() => _HomepagCNState();
}

class _HomepagCNState extends State<HomepageCN> {
  DateTime _selectedDate = DateTime.now();
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
          Container(
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor: GlobalColors.mainColor,
              selectedTextColor: Colors.white,
              dateTextStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
              monthTextStyle: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
              onDateChange: (date) {
                _selectedDate = date;
              },
            ),
          ),
          const SizedBox(height: 10),
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
          CardTarde(),
          const SizedBox(height: 10),
          Text(
            "Turno Noche (00:00-08:00)",
            style: TextStyle(
                color: GlobalColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          CardNoche(),
        ],
      ),
    );
  }
}
