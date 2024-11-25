import 'dart:developer';

import 'package:flourish/utils/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool checkBoxValue = false.obs;
  RxBool isLoading = false.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString nameError = ''.obs;
  RxString phoneError = ''.obs;
  ApiService apiService = ApiService();

  void checkBoxValueChange(bool value) {
    checkBoxValue.value = value;
  }

  Future<void> getCode() async {
    isLoading.value = true;
    try {
      final respose = await apiService.postRequest('auth/get-code', {
        "email": emailController.text,
      });
      log(respose.body.toString());
      if (respose.statusCode == 200) {
        Get.toNamed("/verifyEmail", arguments: [
          emailController.text,
          passwordController.text,
          nameController.text,
          phoneController.text,
        ]);
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }
  // /verify-account
}
