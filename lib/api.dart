import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = 'http://localhost/fl/';

  Future<String> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login.php'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<String> register(
      String username, String password, String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register.php'),
      body: {'username': username, 'password': password, 'email': email},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register');
    }
  }
}
