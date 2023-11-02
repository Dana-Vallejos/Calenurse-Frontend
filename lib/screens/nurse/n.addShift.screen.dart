import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nssystem/screens/nurse/n.home.dart';
import '../../utils/global.colors.dart';
import '../../widgets/input_field.dart';
import 'n.homepage.screen.dart';



class AddPreference extends StatefulWidget {
  const AddPreference({Key? key}) : super(key: key);

  @override
  State<AddPreference> createState() => _AddPreferenceState();
}

class _AddPreferenceState extends State<AddPreference> {

  final TextEditingController _titleController = TextEditingController();

  DateTime _selectDate = DateTime.now();
  String _endTime = "9:30 pm";
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _selectedShift=  "Turno mañana";
  List<String> shift=[
    "Turno mañana",
    "Turno tarde",
    "Turno noche",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              MyInputField(title: "Título" , hint: "Ingresa un título", controller: _titleController ,),
              MyInputField(title: "Turnos", hint: "$_selectedShift",
                widget: DropdownButton(
                  icon: Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey,),
                  iconSize: 32,
                  elevation: 4,
                  style: subTitleStyle,
                  underline: Container(height: 0,),
                  onChanged: (String? newValue){
                    setState(() {
                      _selectedShift= newValue!;
                    });
                  },
                  items: shift.map<DropdownMenuItem<String>>((String? value){
                    return DropdownMenuItem<String>(
                        value:value,
                        child: Text(value!, style: TextStyle(color:Colors.grey))
                    );
                  }
                  ).toList(),
                ),
              ),
              MyInputField(
                  title: "Fecha",
                  hint: DateFormat.yMd().format(_selectDate),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined),
                    color: Colors.blue,
                    onPressed: () {
                      _getDateFromUser();
                    },
                  )),

              Row(
                children: [
                  Expanded(
                      child: MyInputField(
                        title: "Hora de Inicio",
                        hint: _startTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: true);
                            },
                            icon: Icon(Icons.access_time_rounded,
                                color: Colors.blue)),
                      )),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: MyInputField(
                        title: "Hora de Fin",
                        hint: _endTime,
                        widget: IconButton(
                            onPressed: () {
                              _getTimeFromUser(isStartTime: false);
                            },
                            icon: Icon(Icons.access_time_rounded,
                                color: Colors.blue)),
                      )),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //ButtonWidget(
                  //   text: 'Crear horario',
                  // route:
                  //   MaterialPageRoute(builder: (_) => _validateDate()))

                ],
              ),
                  Center(
                    child: ElevatedButton(
                      onPressed: _validateDate,
                      child: Text('Crear horario'),
                      // Puedes añadir más estilos aquí si lo necesitas.
                    ),
                  )

            ],
          ),
        ),
      ),
    );
  }

  _validateDate() {
    if(_titleController.text.isNotEmpty){
      print("todo bien");

    }else if(_titleController.text.isEmpty){
      Get.snackbar("El título es requerido", "Todos los campos son obligatorios",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: GlobalColors.secondaryColor,
          colorText: GlobalColors.textColor,
          icon: Icon(Icons.warning_amber_rounded,
              color: Colors.red)
      );

    }

  }


  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2121),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectDate = _pickerDate;
      });
    } else {
      print("hey");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time canceled ");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
        ));
  }
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