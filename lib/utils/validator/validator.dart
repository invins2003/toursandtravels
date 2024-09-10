// validator.dart
class Validator {
  Validator._();

  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Mobile number validation
  static String? validateMobile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile number is required';
    }
    final RegExp mobileRegExp = RegExp(
      r'^\d{10}$', // Assumes 10-digit mobile numbers
    );
    if (!mobileRegExp.hasMatch(value)) {
      return 'Enter a valid mobile number';
    }
    return null;
  }

  // Generic required field validation
  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Custom validation
  static String? validateCustom(String? value, {required String pattern, required String errorMessage}) {
    final RegExp customRegExp = RegExp(pattern);
    if (value == null || !customRegExp.hasMatch(value)) {
      return errorMessage;
    }
    return null;
  }
}
