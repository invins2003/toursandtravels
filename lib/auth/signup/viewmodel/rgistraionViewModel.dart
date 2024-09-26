import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final registrationProvider = StateNotifierProvider<RegistrationViewModel, bool>(
  (ref) => RegistrationViewModel(),
);

class RegistrationViewModel extends StateNotifier<bool> {
  RegistrationViewModel() : super(false);

  Future<bool> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String userName,
    required String phoneNumber,
    required String password,
  }) async {
    final url = Uri.parse('https://sainath-backend-4nws.onrender.com/auth/signup');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        // 'firstName': firstName,
        // 'lastName': lastName,
        'email': email,
        'fullName':'$firstName $lastName',
        // 'userName': userName,
        // 'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (responseData['message']) {
        return true; // Registration successful
      }
    } else if (response.statusCode == 400) {
      final responseData = jsonDecode(response.body);
      if (responseData['error']) {
        throw Exception('Account already exists');
      }
    } else {
      throw Exception('Registration failed');
    }

    return false;
  }
}
