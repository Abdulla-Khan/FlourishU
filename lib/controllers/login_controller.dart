import 'package:flourish/utils/services/form_validation_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLogoVisible = false.obs;
  RxBool isLogoOnTop = false.obs;
  RxBool showFields = false.obs;
  RxBool checkBoxValue = false.obs;
  TextEditingController emailController = TextEditingController();
  RxString emailError = ''.obs;
  RxBool isLoading = false.obs;
  TextEditingController passwordController = TextEditingController();
  RxString passwordError = ''.obs;
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(microseconds: 200), () {
      isLogoVisible.value = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      isLogoOnTop.value = true;

      Future.delayed(const Duration(seconds: 2), () {
        showFields.value = true;
      });
    });
  }

  void checkBoxValueChange(bool value) {
    checkBoxValue.value = value;
  }

  bool validateForm() {
    validateEmail(emailController.text, emailError);
    validatePassword(passwordController.text, passwordError);

    return emailError.value.isEmpty && passwordError.value.isEmpty;
  }
}
