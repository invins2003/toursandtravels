import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse('https://sainath-backend-4nws.onrender.com/auth/login'); // Your login API URL

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }
}

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepository();
});