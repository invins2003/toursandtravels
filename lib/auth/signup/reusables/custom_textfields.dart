import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final bool obscureText;
  final IconData? icon; // Optional icon
  final FormFieldValidator<String>? validator;
  final IconButton? suffixIcon;

  // Constructor
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.keyboardType,
    required this.controller,
    this.obscureText = false,
    this.icon, // Icon is optional
    this.validator,
    this.suffixIcon, // Validation function is optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04, // 4% of the screen width for padding
        vertical: screenHeight * 0.01,  // 1% of the screen height for padding
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText, // Used for password fields
        validator: validator, // Add validation
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: icon != null ? Icon(icon) : null, // Add leading icon if available
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03, // Padding inside text field
            vertical: screenHeight * 0.02,
          ),
        ),
      ),
    );
  }
}
