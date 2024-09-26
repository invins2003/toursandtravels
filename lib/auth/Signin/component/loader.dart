import 'dart:ui';
import 'package:flutter/material.dart';

class Loader {
  // Public method to show the loading dialog with customizable parameters
  static void showLoadingDialog(
    BuildContext context, {
    String message = 'Loading...',        // Default message
    double blurIntensity = 5.0,           // Default blur intensity
    Color backgroundColor = Colors.white, // Default background color
    Color textColor = Colors.black,       // Default text color
    Color loaderColor = Colors.blue,      // Default loader color
    bool barrierDismissible = false,      // Default to non-dismissable
  }) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible, // Optionally allow closing by tapping outside
      builder: (BuildContext context) {
        return Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
            // Loader dialog
            Center(
              child: AlertDialog(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(loaderColor),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      message,
                      style: TextStyle(color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Method to hide the loading dialog
  static void hideLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
