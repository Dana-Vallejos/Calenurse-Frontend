import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../utils/global.colors.dart';


class HomePageNurse extends StatefulWidget {
  const HomePageNurse({Key? key}) : super(key: key);

  @override
  State<HomePageNurse> createState() => _HomePageNurseState();
}

class _HomePageNurseState extends State<HomePageNurse> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Horario"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              // acción al presionar flecha
            }),
      ),
      body: Column(
          children: [
          _addTaskBar(),
      Container(
        margin: const EdgeInsets.only(top: 20, left: 20),
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
        )
      )
        ],
      ),
    );
  }
}

_addTaskBar() {
  return Container(
    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Hoy",
                style: headingStyle,
              )
            ],
          ),
        ),

      ],
    ),
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.normal, color: Colors.grey));
}

TextStyle get headingStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
}
