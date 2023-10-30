import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nssystem/model/request.model.dart';
import 'package:nssystem/screens/chief_nurse/cn.home.dart';
import 'package:nssystem/utils/global.colors.dart';
import 'package:nssystem/widgets/button.dart';
import 'package:nssystem/widgets/field.dart';
import 'package:nssystem/widgets/shift.card.dart';

class RequestDetailsScreen extends StatelessWidget {
  final RequestModel request;

  RequestDetailsScreen({
    required this.request,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Solicitudes',
            style: TextStyle(
                color: GlobalColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildField("Nombre", '${request.name} ${request.lastName}'),
            SizedBox(height: 20),
            ShiftCard(
                shiftName: request.previousShiftName,
                shiftTime: request.previousShift),
            SizedBox(height: 20),
            ShiftCard(
                shiftName: request.newShiftName, shiftTime: '08:00 - 16:00'),
            SizedBox(height: 20),
            buildField("Suplente", '${request.substituteName}'),
            Spacer(),
            ButtonWidget(
              text: 'Rechazar Solicitud',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              onPressed: (BuildContext context) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            SizedBox(height: 20),
            ButtonWidget(
              text: 'Aceptar Solicitud',
              backgroundColor: GlobalColors.mainColor,
              textColor: Colors.white,
              onPressed: (BuildContext context) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
