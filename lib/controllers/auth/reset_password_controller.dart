import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/services/api_service.dart';

class ResetPasswordController extends GetxController {
  RxString otp = "".obs;
  TextEditingController passwordController = TextEditingController();
  RxString passwordError = "".obs;
  RxBool isOtpVerified = false.obs;
  RxBool isLoading = false.obs;

  final ApiService apiService = ApiService();

  Future<void> forgotPasswordVerify() async {
    try {
      isLoading.value = true;
      final response = await apiService.postRequest(
          'auth/verify', {'email': Get.arguments, 'code': otp.value});
      log(response.toString());
      if (response.statusCode == 200) {
        otp.value = "";
        isLoading.value = false;
        isOtpVerified.value = true;
      } else if (response.statusCode == 400) {
        isLoading.value = false;
        log('Provide a valid email');
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }

  Future<void> updateForgotPassword() async {
    try {
      isLoading.value = true;
      final response = await apiService.postRequest(
          'auth/forgot-password-update',
          {'email': Get.arguments, 'newPassword': passwordController.text});
      log(response.toString());
      log(Get.arguments);
      if (response.statusCode == 200) {
        otp.value = "";
        isLoading.value = false;
        isOtpVerified.value = true;
      } else if (response.statusCode == 400) {
        isLoading.value = false;
        log('Provide a valid email');
      }
    } catch (e) {
      log(e.toString());
      isLoading.value = false;
    }
  }
}
