import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:toursandtravels/auth/signup/email_verification.dart';
import 'package:toursandtravels/auth/signup/reusables/custom_button.dart';
import 'package:toursandtravels/auth/signup/reusables/custom_textfields.dart';
import 'package:toursandtravels/auth/signup/reusables/loadingDialog.dart';
// import 'package:toursandtravels/home_screen.dart';
import 'package:toursandtravels/utils/validator/validator.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _emailID = TextEditingController();
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Loader _loader = Loader(); // Create an instance of Loader
  bool _isAgreed = false; // Track whether the user has agreed to terms

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: CustomScrollView(
      slivers: [
        // SliverAppBar without background image
        const SliverAppBar(
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Registration'),
          ),
        ),

        // SliverList for the registration form
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              labelText: 'First Name',
                              keyboardType: TextInputType.name,
                              controller: _firstName,
                              icon: Icons.person,
                              validator: Validator.validateRequired,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomTextField(
                              labelText: 'Last Name',
                              keyboardType: TextInputType.name,
                              controller: _lastName,
                              icon: Icons.person,
                              validator: Validator.validateRequired,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailID,
                        icon: Icons.email,
                        validator: Validator.validateEmail,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'User Name',
                        keyboardType: TextInputType.name,
                        controller: _userName,
                        icon: Icons.account_circle,
                        validator: Validator.validateRequired,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        controller: _phoneNumber,
                        icon: Icons.phone,
                        validator: Validator.validateMobile,
                      ),
                      const SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        controller: _password,
                        obscureText: true,
                        icon: Icons.lock,
                        validator: Validator.validatePassword,
                      ),
                      const SizedBox(height: 20),

                      // Checkbox for "Agree to Privacy Policy and Terms of Use"
                      CheckboxListTile(
                        value: _isAgreed,
                        onChanged: (bool? value) {
                          setState(() {
                            _isAgreed = value ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                        title: const Text(
                          'I agree to the privacy policy and terms of use.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Sign Up button
                      CustomButton(
                        text: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (_isAgreed) {
                              // If the user agreed to the terms
                              _loader.showLoadingDialog(context); // Show loader
                              // Simulate a network call or processing
                              Future.delayed(const Duration(seconds: 3), () {
                                Navigator.pop(context); // Close the dialog
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmailVerificationPage(email: _emailID.text,)),
                                );
                              });
                            } else {
                              // Show a dialog or snackbar if terms are not agreed
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You must agree to the privacy policy and terms of use.'),
                                ),
                              );
                            }
                          } else {
                            print('Form is not valid.');
                          }
                        },
                        borderRadius: 12.0,
                        fontSize: 18.0,
                        padding: 14.0,
                      ),
                      const SizedBox(height: 20),

                      // "Sign up with" text
                      const Text(
                        'Or sign up with',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),

                      // Row for Facebook and Google buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Facebook button with white background and border
                          GestureDetector(
                            onTap: () {
                              print('Sign up with Facebook');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white, // White background
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all( // Adding border
                                  color: Colors.grey, 
                                  width: 1.0,
                                ),
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
                                'assets/images/facebook.png', // Add your Facebook icon
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20), // Spacing between buttons

                          // Google button with white background and border
                          GestureDetector(
                            onTap: () {
                              print('Sign up with Google');
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.white, // White background
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all( // Adding border
                                  color: Colors.grey, 
                                  width: 1.0,
                                ),
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
                                'assets/images/google.png', // Add your Google icon
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}
