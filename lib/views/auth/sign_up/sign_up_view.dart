import 'package:flourish/controllers/sign_up_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flourish/views/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "auth-logo",
                  child: SvgPicture.asset(
                    'assets/logo/logo.svg',
                    height: 130,
                  ),
                ),
                textFeild(
                  "Name",
                  TextEditingController(),
                ),
                textFeild(
                  "Phone Number",
                  TextEditingController(),
                ),
                textFeild(
                  "University Email Address",
                  TextEditingController(),
                ),
                PasswordFeild(
                  name: "Password",
                  controller: TextEditingController(),
                ),
                SizedBox(height: context.height * 0.02),
                Row(
                  children: [
                    SizedBox(
                      height: 24.0,
                      width: 24.0,
                      child: Checkbox(
                        side: BorderSide(color: Colors.black.withOpacity(0.3)),
                        checkColor: Colors.white,
                        activeColor: textBtnColor,
                        value: controller.checkBoxValue.value,
                        onChanged: (value) =>
                            controller.checkBoxValueChange(value!),
                      ),
                    ),
                    const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'I agree to the ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Terms and Conditions, Privacy and Policy.',
                            style: TextStyle(
                              color: textBtnColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.02),
                CustomButton(
                  text: "Sign up",
                  onTap: () => Get.toNamed("/verifyEmail"),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
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
                          Get.offNamed('/');
                        },
                        child: const Text(
                          "Log in",
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
        ),
      ),
    );
  }
}
