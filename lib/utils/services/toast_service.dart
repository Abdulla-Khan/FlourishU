import 'package:flourish/utils/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class FlutterToastService {
  static final FlutterToastService _instance = FlutterToastService._internal();

  factory FlutterToastService() {
    return _instance;
  }

  FlutterToastService._internal();

  // Show a success toast
  void showSuccess(String message) {
    _showToast(message, ToastGravity.BOTTOM, textBtnColor);
  }

  // Show an error toast
  void showError(String message) {
    _showToast(message, ToastGravity.BOTTOM, Colors.red);
  }

  // Show an informational toast
  void showInfo(String message) {
    _showToast(message, ToastGravity.BOTTOM, Colors.blue);
  }

  // Private method to display a toast
  void _showToast(String message, ToastGravity gravity, Color backgroundColor) {
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
