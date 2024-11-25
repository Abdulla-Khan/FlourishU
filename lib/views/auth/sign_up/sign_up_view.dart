import 'package:flourish/controllers/sign_up_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/services/form_validation_service.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../components/common/custom_button.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Obx(
            () => SingleChildScrollView(
              child: SizedBox(
                height: context.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "auth-logo",
                      child: SvgPicture.asset(
                        'assets/logo/logo.svg',
                        height: context.height * 0.14,
                      ),
                    ),
                    textFeild(
                      "Name",
                      controller.nameController,
                      validator: (value) => controller.nameError.value.isEmpty
                          ? null
                          : controller.nameError.value,
                      onChanged: (value) =>
                          validateName(value, controller.nameError),
                      errorMessage: controller.nameError.value,
                    ),
                    textFeild(
                      "Phone Number",
                      controller.phoneController,
                      validator: (value) => controller.phoneError.value.isEmpty
                          ? null
                          : controller.phoneError.value,
                      onChanged: (value) =>
                          validatePhoneNumber(value, controller.phoneError),
                      errorMessage: controller.phoneError.value,
                    ),
                    textFeild(
                      "University Email Address",
                      controller.emailController,
                      validator: (value) => controller.emailError.value.isEmpty
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
                      onChanged: (value) => validateCompletePassword(
                          value, controller.passwordError),
                      errorMessage: controller.passwordError.value,
                    ),
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
                                text:
                                    'Terms and Conditions, Privacy and Policy.',
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
                    const Spacer(),
                    controller.isLoading.value == true
                        ? const CircularProgressIndicator(
                            color: textBtnColor,
                          )
                        : CustomButton(
                            text: "Sign up",
                            onTap: () {
                              controller.getCode();
                            },
                          ),
                    const Spacer(
                      flex: 3,
                    ),
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
                              Get.offNamed('/',
                                  arguments: {'showAnimation': false});
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
