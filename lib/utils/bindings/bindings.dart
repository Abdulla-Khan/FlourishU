import 'package:flourish/controllers/auth/email_verify_controller.dart';
import 'package:flourish/controllers/auth/forgot_password_controller.dart';
import 'package:flourish/controllers/auth/onboarding_controller.dart';
import 'package:flourish/controllers/auth/reset_password_controller.dart';
import 'package:flourish/controllers/auth/sign_up_controller.dart';
import 'package:flourish/controllers/auth/login_controller.dart';
import 'package:flourish/controllers/customize_diet_plans/customize_diet_plans_controller.dart';
import 'package:flourish/controllers/home/home_controller.dart';
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
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CustomizeDietPlansController(), fenix: true);
  }
}
