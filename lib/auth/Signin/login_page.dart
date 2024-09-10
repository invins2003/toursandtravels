import 'package:flutter/material.dart';
import 'package:toursandtravels/auth/signup/Signup.dart'; // Import the SignupPage
import 'package:toursandtravels/auth/signup/reusables/custom_button.dart';
import 'package:toursandtravels/routes/bottom_navbar.dart';
import 'package:toursandtravels/utils/device/device_utils.dart';
import 'package:toursandtravels/utils/validator/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isTablet = DeviceUtil.isTablet(context);
    bool isPortrait = DeviceUtil.isPortrait(context);

    // Retrieve the current theme's text theme
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center all items
            children: [
              SizedBox(
                height: isTablet
                    ? (isPortrait ? DeviceUtil.screenHeight(context) * 0.3 : DeviceUtil.screenHeight(context) * 0.2)
                    : DeviceUtil.screenHeight(context) * 0.2, // Adjust height for phone/tablet
                child: Center(
                  child: Text(
                    'Welcome to Shivam!',
                    style: textTheme.displayLarge?.copyWith(
                      color: Colors.blue,
                      fontSize: isTablet ? 36 : 28, // Larger text for tablets
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Explore the world with ease.\nLog in to continue booking your next adventure!',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: isTablet ? 20 : 16, // Adjust text size for tablets and phones
                ),
                textAlign: TextAlign.center, // Center text
              ),
              const SizedBox(height: 30),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Email field
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
                    // Password field
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
                    // Login button
                    CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Perform login action
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NavigationMenu()),
                          );
                          print('Logging in...');
                        }
                      },
                      color: Colors.blue, // Customize button color if needed
                      textColor: Colors.white,
                      borderRadius: 12.0,
                      fontSize: isTablet ? 18 : 14,
                      padding: 16.0,
                    ),
                    const SizedBox(height: 20),
                    // "Login with" text
                    Text(
                      'Or login with',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center, // Center text
                    ),
                    const SizedBox(height: 20),
                    // Row for Facebook and Google buttons
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
                              shape: BoxShape.rectangle,
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
                              shape: BoxShape.rectangle,
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
                    // Footer with password and support link
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
