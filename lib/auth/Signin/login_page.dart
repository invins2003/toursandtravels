import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toursandtravels/auth/Signin/viewmodel/loginViewModel.dart';
import 'package:toursandtravels/auth/signup/Signup.dart';
import 'package:toursandtravels/routes/bottom_navbar.dart';
import 'package:toursandtravels/utils/device/device_utils.dart';
import 'package:toursandtravels/utils/validator/validator.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceUtil.isTablet(context);
    bool isPortrait = DeviceUtil.isPortrait(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    final loginState = ref.watch(loginProvider);
    final loginNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: isTablet
                    ? (isPortrait ? DeviceUtil.screenHeight(context) * 0.3 : DeviceUtil.screenHeight(context) * 0.2)
                    : DeviceUtil.screenHeight(context) * 0.2,
                child: Center(
                  child: Text(
                    'Welcome to Shivam!',
                    style: textTheme.displayLarge?.copyWith(
                      color: Colors.blue,
                      fontSize: isTablet ? 36 : 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Explore the world with ease.\nLog in to continue booking your next adventure!',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: isTablet ? 20 : 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => Validator.validateEmail(value),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) => Validator.validatePassword(value),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: loginState.isLoading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                loginNotifier.login(
                                  _emailController.text,
                                  _passwordController.text,
                                ).then((_) {
                                  if (loginState.isLoggedIn) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const NavigationMenu()),
                                    );
                                  } else if (loginState.errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(loginState.errorMessage!)),
                                    );
                                  }
                                });
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        textStyle: TextStyle(fontSize: isTablet ? 18 : 14),
                      ),
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Or login with',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Login with Facebook');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.grey, width: 1.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/facebook.png',
                              width: isTablet ? 50 : 40,
                              height: isTablet ? 50 : 40,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () {
                            print('Login with Google');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Colors.grey, width: 1.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/google.png',
                              width: isTablet ? 50 : 40,
                              height: isTablet ? 50 : 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegistrationPage()),
                            );
                          },
                          child: Text(
                            'Don’t have an account? Sign Up',
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Forgot Password?',
                          style: textTheme.bodyMedium?.copyWith(
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Need help? Contact support@Shivam.com',
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: isTablet ? 16 : 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
