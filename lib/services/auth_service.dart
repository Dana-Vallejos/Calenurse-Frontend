import 'package:http/http.dart' as http;
import 'package:nssystem/domain/user.dart';
import 'package:nssystem/services/api.dart';

class AuthService extends Api {
  Future<User?> login(String email, String password) async {
    final http.Response response = await post(
      '/login',
      {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 400) {
      return null;
    }
    return User.fromJson(response.body);
  }

  Future<User> register(String username, String password, String name, int age,
      String email, bool isBoss, int areaId) async {
    final http.Response response = await post(
      '/signup',
      {
        'username': username,
        'password': password,
        'name': name,
        'age': age,
        'email': email,
        'isBoss': isBoss,
        'areaId': areaId,
      },
    );
    if (response.statusCode == 400) {
      throw Exception('Intentelo nuevamente');
    }
    return User.fromJson(response.body);
  }
}
