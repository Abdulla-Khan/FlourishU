import 'package:flourish/controllers/email_verify_controller.dart';
import 'package:flourish/controllers/forgot_password_controller.dart';
import 'package:flourish/controllers/onboarding_controller.dart';
import 'package:flourish/controllers/reset_password_controller.dart';
import 'package:flourish/controllers/sign_up_controller.dart';
import 'package:flourish/controllers/login_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => EmailVerifyController(), fenix: true);
    Get.lazyPut(() => OnboardingController(), fenix: true);
    Get.lazyPut(() => ForgotPasswordController(), fenix: true);
    Get.lazyPut(() => ResetPasswordController(), fenix: true);
  }
}
