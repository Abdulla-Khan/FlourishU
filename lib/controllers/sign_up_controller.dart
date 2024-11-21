import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool checkBoxValue = false.obs;

  void checkBoxValueChange(bool value) {
    checkBoxValue.value = value;
  }
}
