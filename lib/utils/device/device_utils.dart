// device_util.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher_string.dart';

class DeviceUtil {
  DeviceUtil._();

static bool isTablet(BuildContext context) {
  final size = MediaQuery.of(context).size;
  final diagonal = sqrt(size.width * size.width + size.height * size.height);
  return diagonal > 1100.0;
}

  static bool isPhone(BuildContext context) {
    return !isTablet(context);
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenAspectRatio(BuildContext context) {
    return MediaQuery.of(context).size.aspectRatio;
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double bottomBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  static double pixelRatio(BuildContext context) {
    return MediaQuery.of(context).devicePixelRatio;
  }

  static Future<void> setStatusBarColor(Color color, {Brightness brightness = Brightness.dark}) async {
    try {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarBrightness: brightness,
      ));
    } catch (e) {
      print('Error setting status bar color: $e');
    }
  }

  static Future<void> launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<bool> hasInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }
}
