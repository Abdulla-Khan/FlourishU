import 'dart:developer';

import 'package:flourish/utils/services/api_service.dart';
import 'package:flourish/utils/services/form_validation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/services/toast_service.dart';

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
  RxString checkBoxError = ''.obs;
  RxString phoneError = ''.obs;
  ApiService apiService = ApiService();

  bool validateForm() {
    validateEmail(emailController.text, emailError);
    validateCompletePassword(passwordController.text, passwordError);
    validateName(nameController.text, nameError);
    validatePhoneNumber(phoneController.text, phoneError);
    if (!checkBoxValue.value) {
      FlutterToastService().showError("Agree to Term and Conditions");
      checkBoxError.value = 'You must agree to the terms and conditions';
    } else {
      checkBoxError.value = '';
    }

    return emailError.value.isEmpty &&
        checkBoxError.value.isEmpty &&
        passwordError.value.isEmpty &&
        nameError.value.isEmpty &&
        phoneError.value.isEmpty;
  }

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
      } else {
        isLoading.value = false;
        FlutterToastService()
            .showError("Unable to to Sign Up. Try Again Later");
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }
  // /verify-account
}
