import 'package:http/http.dart' as http;
import 'package:nssystem/domain/desired.shift.dart';
import 'package:nssystem/services/api.dart';

class DesiredShiftService extends Api {
  Future<DesiredShift> createShift(
      DesiredShift desiredShift, int nurseId) async {
    final http.Response response = await post(
      '/register',
      {
        ...desiredShift.toMap(),
      },
    );
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return DesiredShift.fromJson(response.body);
  }
}
