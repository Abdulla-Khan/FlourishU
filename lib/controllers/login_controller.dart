import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLogoVisible = false.obs;
  RxBool isLogoOnTop = false.obs;
  RxBool showFields = false.obs;
  RxBool checkBoxValue = false.obs;

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
}
