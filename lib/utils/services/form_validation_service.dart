import 'package:get/get.dart';

void validateEmail(String value, RxString errorString) {
  String email = value.trim();
  RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

  if (email.isEmpty) {
    errorString.value = "Email is required";
  } else if (!emailRegex.hasMatch(email)) {
    errorString.value = "Invalid email format";
  } else {
    errorString.value = '';
  }
}

void validatePassword(String value, RxString errorString) {
  String password = value;

  if (password.isEmpty) {
    errorString.value = "Password is required";
  } else if (password.length < 8) {
    errorString.value = "Password must contain at least 8 characters";
  } else {
    errorString.value = '';
  }
}

void validateName(String value, RxString errorMessage) {
  String firstName = value.trim();

  if (firstName.isEmpty) {
    errorMessage.value = "First name is required";
  } else if (firstName.length < 2 || firstName.length > 25) {
    errorMessage.value = "First name should be between 2 and 25 characters";
  } else {
    errorMessage.value = '';
  }
}

void validateCompletePassword(String value, RxString passwordError) {
  String password = value;
  String errorMessage = '';

  if (password.isEmpty) {
    errorMessage = "Password is required";
  } else {
    if (password.length < 8) {
      errorMessage += "at least 8 characters, ";
    }
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errorMessage += "1 uppercase letter, ";
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      errorMessage += "1 lowercase letter, ";
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      errorMessage += "1 digit, ";
    }
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      errorMessage += "1 special character, ";
    }

    if (errorMessage.isNotEmpty) {
      errorMessage =
          "Password must contain ${errorMessage.substring(0, errorMessage.length - 2)}.";
    }
  }

  passwordError.value = errorMessage;
}

void validatePhoneNumber(String value, RxString errorString) {
  String phoneNumber = value.trim();
  RegExp phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$'); // E.164 format

  if (phoneNumber.isEmpty) {
    errorString.value = "Phone number is required";
  } else if (!phoneRegex.hasMatch(phoneNumber)) {
    errorString.value = "Invalid phone number format";
  } else {
    errorString.value = '';
  }
}
