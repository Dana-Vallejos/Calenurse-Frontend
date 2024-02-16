import 'package:http/http.dart' as http;
import 'package:nssystem/domain/generated_shift.dart';
import 'package:nssystem/services/api.dart';

class ScheduleService extends Api {
  Future<GeneratedShift> createShift(
      GeneratedShift desiredShift, int nurseId) async {
    final http.Response response = await post(
      '/register',
      {
        ...desiredShift.toMap(),
      },
    );
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return GeneratedShift.fromJson(response.body);
  }
}
