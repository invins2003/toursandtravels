import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toursandtravels/auth/Signin/model/apiService.dart';

class LoginState {
  final bool isLoading;
  final bool isLoggedIn;
  final String? errorMessage;

  LoginState({
    this.isLoading = false,
    this.isLoggedIn = false,
    this.errorMessage,
  });

  LoginState copyWith({
    bool? isLoading,
    bool? isLoggedIn,
    String? errorMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class LoginNotifier extends StateNotifier<LoginState> {
  final LoginRepository loginRepository;

  LoginNotifier(this.loginRepository) : super(LoginState());

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    if (isLoggedIn) {
      state = state.copyWith(isLoggedIn: true);
    }
  }

  Future<bool> login(String email, String password) async {
    state = state.copyWith(isLoading: true);

    try {
      final response = await loginRepository.login(email, password);
      if (response.containsKey('token')) {
        // Store login state in Shared Preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        await prefs.setString('token', response['token']); // Assuming the response contains a token

        state = state.copyWith(isLoggedIn: true, isLoading: false);
        return true; // Successful login
      } else {
        state = state.copyWith(errorMessage: 'Invalid credentials', isLoading: false);
        return false; // Login failed
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
      return false; // Login failed with error
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('token');
    state = state.copyWith(isLoggedIn: false);
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref.read(loginRepositoryProvider));
});
