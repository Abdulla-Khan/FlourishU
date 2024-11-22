import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString passwordError = "".obs;
}
