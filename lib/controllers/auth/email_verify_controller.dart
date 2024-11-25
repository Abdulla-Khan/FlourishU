import 'dart:convert';
import 'dart:developer';

import 'package:flourish/utils/services/api_service.dart';
import 'package:flourish/utils/services/local_storage.dart';
import 'package:flourish/utils/services/toast_service.dart';
import 'package:get/get.dart';

class EmailVerifyController extends GetxController {
  RxString otp = "".obs;
  final ApiService apiService = ApiService();
  RxBool isLoading = false.obs;
  String? name;
  String? email;
  String? phone;
  String? password;

  @override
  void onInit() {
    email = Get.arguments[0];
    password = Get.arguments[1];
    name = Get.arguments[2];
    phone = Get.arguments[3];
    super.onInit();
  }

  Future<void> verifyEmail() async {
    isLoading.value = true;
    try {
      final response = await apiService.postRequest(
          'auth/verify-account', {"email": email, "code": otp.value});
      if (response.statusCode == 200) {
        signUpUser();
      } else {
        isLoading.value = false;
        Get.back();
        FlutterToastService().showError("Unable to Verify OTP");
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }

  Future<void> signUpUser() async {
    try {
      final response = await apiService.postRequest('auth/sign-up', {
        "email": email,
        "name": name,
        "password": password,
        "phone": phone,
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        isLoading.value = false;
        final String token = responseData['data']['accessToken'].toString();
        await LocalStorageService.saveData('auth_token', token);
        Get.toNamed("/personalInfo");
      } else {
        Get.back();
        isLoading.value = false;
        FlutterToastService().showError("Unable to Verify OTP");
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }
}
