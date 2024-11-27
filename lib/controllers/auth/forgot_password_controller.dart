import 'dart:developer';

import 'package:flourish/utils/services/api_service.dart';
import 'package:flourish/utils/services/toast_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();
  RxString emailError = "".obs;
  final ApiService apiService = ApiService();
  RxBool isLoading = false.obs;
  Future<void> forgotPassword() async {
    // try {
    //   isLoading.value = true;
    //   final response = await apiService.postRequest('auth/forgot-password', {
    //     'email': emailController.text,
    //   });

    //   if (response.statusCode == 200) {
    //     isLoading.value = false;
    Get.toNamed('/forgotPasswordConfirm', arguments: emailController.text);
    //   } else if (response.statusCode == 400) {
    //     isLoading.value = false;

    //     FlutterToastService().showError('Provide a valid email');
    //   }
    // } catch (e) {
    //   isLoading.value = false;
    //   log(e.toString());
    // }
  }
}
