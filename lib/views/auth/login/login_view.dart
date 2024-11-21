import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flourish/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
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
                      begin: controller.isLogoOnTop.value ? 300 : 200,
                      end: controller.isLogoOnTop.value ? 130 : 200,
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
                        TextEditingController(),
                      ),
                      PasswordFeild(
                        name: "Password",
                        controller: TextEditingController(),
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
                                  onChanged: (value) =>
                                      controller.checkBoxValueChange(value!),
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
                      CustomButton(
                        text: "Login",
                        onTap: () {},
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
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
  });
  final String text;
  final Function()? onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: context.height * 0.06,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          color: textBtnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
