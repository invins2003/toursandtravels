import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final double padding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.fontSize = 16.0,
    this.padding = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04, // Matching TextField padding
      ),
      child: SizedBox(
        width: double.infinity, // This makes the button take full width of the parent
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Background color
            padding: EdgeInsets.symmetric(
              vertical: padding, // Vertical padding inside the button
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
