import 'dart:developer';

import 'package:flourish/utils/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxString emailError = "".obs;
  final ApiService apiService = ApiService();

  Future<void> forgotPassword() async {
    try {
      final response = await apiService.postRequest('auth/forgot-password', {
        'email': emailController.text,
      });

      if (response.statusCode == 200) {
        Get.toNamed('/forgotPasswordConfirm', arguments: emailController.text);
      } else if (response.statusCode == 400) {
        log('Provide a valid email');
      }
    } catch (e) {}
  }
}
