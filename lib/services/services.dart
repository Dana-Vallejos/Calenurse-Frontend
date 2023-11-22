import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl =
      "http://54.161.150.128"; // Reemplaza con tu URL base real

  // Función para iniciar sesión
  Future<http.Response> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  // Función para registro
  Future<http.Response> registerUser(String name, String phone, String email,
      String password, String type, String area) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'type': type,
        'area': area,
      }),
    );
    return response;
  }

  // Función para crear horarios
  Future<http.Response> createSchedule(
      int morningShift, int afternoonShift, int nightShift) async {
    final response = await http.post(
      Uri.parse('$baseUrl/schedule/generate'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'morning_shift': morningShift,
        'afternoon_shift': afternoonShift,
        'night_shift': nightShift,
      }),
    );
    return response;
  }

  // Función para registrar preferencias
  Future<http.Response> registerPreferences(
      String nurseId, String shift, String date) async {
    final response = await http.post(
      Uri.parse(
          'https://calenurse.cloudns.org/nurse/$nurseId/schedule-preferences'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'shift': shift,
        'date': date,
      }),
    );
    return response;
  }
}
