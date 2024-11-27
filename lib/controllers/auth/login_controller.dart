import 'dart:developer';

import 'package:flourish/utils/services/api_service.dart';
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
  final ApiService apiService = ApiService();
  @override
  void onInit() {
    super.onInit();
    bool showAnimation = Get.arguments?['showAnimation'] ?? true;
    if (showAnimation) {
      _startAnimation();
    } else {
      isLogoVisible.value = true;
      isLogoOnTop.value = true;
      showFields.value = true;
    }
  }

  void _startAnimation() {
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

  Future<void> login() async {
    Get.toNamed('/home');
    // isLoading.value = true;
    // try {
    //   final response = await apiService.postRequest('auth/sign-in', {
    //     "email": emailController.text,
    //     "password": passwordController.text,
    //   });

    //   if (response.statusCode == 200) {
    //     log('Home');
    //     isLoading.value = false;
    //   } else if (response.statusCode == 400) {
    //     log("Incorrect Email/Password");
    //     isLoading.value = false;
    //   } else if (response.statusCode == 404) {
    //     log("Account Not Found");
    //     isLoading.value = false;
    //   } else {
    //     log("Bad Request");
    //     isLoading.value = false;
    //   }
    // } catch (e) {
    //   isLoading.value = false;
    //   log(e.toString());
    // }
  }
}
