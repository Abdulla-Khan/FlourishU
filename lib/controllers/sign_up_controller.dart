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

  void checkBoxValueChange(bool value) {
    checkBoxValue.value = value;
  }
}
