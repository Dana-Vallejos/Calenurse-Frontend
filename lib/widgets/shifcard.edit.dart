import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nssystem/utils/global.colors.dart';

class ShiftCardEdit extends StatelessWidget {
  final String shiftName;
  final String shiftTime;

  ShiftCardEdit({required this.shiftName, required this.shiftTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            color: GlobalColors.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(Icons.access_time,
                  color: Colors.blue), // Un icono que representa un reloj
              SizedBox(width: 8),
              Column(
                children: [
                  Text(shiftName),
                  Text(shiftTime),
                ],

              ),
              Spacer(),  // Este widget empujará el siguiente widget (IconButton) hacia la derecha
              IconButton(
                icon: Icon(Icons.edit_outlined, color: Colors.blue),  // Icono de edición
                onPressed: () {
                 _showEditDialog(context);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

Future<void> _showEditDialog(BuildContext context) async {
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Editar Horario',
            style: TextStyle(
            color: GlobalColors.textColor, fontWeight: FontWeight.bold, fontSize:19),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: startTimeController,
                    decoration: InputDecoration(
                      hintText: 'Hora de inicio',
                      // ... otros parámetros de decoración
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.access_time, color: Colors.blue),
                  onPressed: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      startTimeController.text = selectedTime.format(context);
                    }
                  },
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: endTimeController,
                    decoration: InputDecoration(
                      hintText: 'Hora de fin',
                      // ... otros parámetros de decoración
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.access_time, color: Colors.blue),
                  onPressed: () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
                      endTimeController.text = selectedTime.format(context);
                    }
                  },
                )
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Guardar'),
          ),
        ],
      );
    },
  );
}



TextStyle get subTitleStyle{
  return GoogleFonts.poppins(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey[400],
      )
  );
}