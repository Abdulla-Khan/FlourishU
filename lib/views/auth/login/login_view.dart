import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/services/form_validation_service.dart';
import 'package:flourish/utils/services/toast_service.dart';
import 'package:flourish/views/components/common/custom_button.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flourish/controllers/auth/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Obx(
          () => SingleChildScrollView(
            child: SizedBox(
              height: context.height * 0.9,
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(seconds: 2),
                    curve: controller.isLogoOnTop.value
                        ? Curves.easeInOut
                        : Curves.easeOut,
                    alignment: controller.isLogoOnTop.value
                        ? Alignment.topCenter
                        : Alignment.center,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 800),
                      opacity: controller.isLogoVisible.value ? 1.0 : 0.0,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(seconds: 2),
                        tween: Tween<double>(
                          begin: controller.isLogoOnTop.value
                              ? context.height * 0.14
                              : context.height * 0.3,
                          end: controller.isLogoOnTop.value
                              ? context.height * 0.14
                              : context.height * 0.3,
                        ),
                        builder: (context, size, child) {
                          return Hero(
                            tag: "auth-logo",
                            child: SvgPicture.asset(
                              'assets/logo/logo.svg',
                              height: size,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (controller.showFields.value)
                    Padding(
                      padding: EdgeInsets.only(
                        top: context.height * 0.25,
                        left: context.width * 0.04,
                        right: context.width * 0.04,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Log in to your Account',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            'Enter your email and password to log in\n',
                            style: TextStyle(
                              color: Color(0xFF6C7278),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textFeild(
                            "Email",
                            controller.emailController,
                            validator: (value) =>
                                controller.emailError.value.isEmpty
                                    ? null
                                    : controller.emailError.value,
                            onChanged: (value) =>
                                validateEmail(value, controller.emailError),
                            errorMessage: controller.emailError.value,
                          ),
                          PasswordFeild(
                            name: "Password",
                            controller: controller.passwordController,
                            validator: (value) =>
                                controller.passwordError.value.isEmpty
                                    ? null
                                    : controller.passwordError.value,
                            onChanged: (value) => validatePassword(
                                value, controller.passwordError),
                            errorMessage: controller.passwordError.value,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Checkbox(
                                      side: BorderSide(
                                          color: Colors.black.withOpacity(0.3)),
                                      checkColor: Colors.white,
                                      activeColor: textBtnColor,
                                      value: controller.checkBoxValue.value,
                                      onChanged: (value) => controller
                                          .checkBoxValueChange(value!),
                                    ),
                                  ),
                                  const Text(
                                    ' Remember Me?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Helvetica Light',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                onPressed: () => Get.toNamed('/forgotPassword'),
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: textBtnColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: textBtnColor,
                                    decorationStyle: TextDecorationStyle.solid,
                                    decorationThickness: 1,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Obx(
                            () => controller.isLoading.value
                                ? const Center(
                                    child: CircularProgressIndicator(
                                        color: textBtnColor),
                                  )
                                : CustomButton(
                                    text: "Login",
                                    onTap: () {
                                      Get.toNamed('/home');
                                      // controller.validateForm()
                                      //     ? controller.login()
                                      //     : FlutterToastService()
                                      //         .showError("Fill all feilds");
                                    },
                                  ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Don’t have an account?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Helvetica Light',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  onPressed: () {
                                    Get.offNamed('/signUp');
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: textBtnColor,
                                      fontSize: 14,
                                      fontFamily: 'Helvetica Light',
                                      fontWeight: FontWeight.w400,
                                      height: 0,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
