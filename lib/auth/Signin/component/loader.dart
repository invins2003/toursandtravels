import 'dart:ui';
import 'package:flutter/material.dart';

class Loader {
  // Public method to show the loading dialog
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return Stack(
          children: [
            // Blurred background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
            // Loader dialog
            Center(
              child: AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 15),
                    Text('Signing In...'),
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
