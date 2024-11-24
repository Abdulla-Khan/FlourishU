
import 'package:flourish/controllers/auth/forgot_password_controller.dart';
import 'package:flourish/utils/services/form_validation_service.dart';

import '../../components/common/custom_button.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios_rounded)),
                  Hero(
                    tag: "auth-logo",
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/logo/logo.svg',
                        height: context.height * 0.14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.128,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                ),
                child: SizedBox(
                  height: context.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.height * 0.02,
                      ),
                      const Text(
                        'Forget your password?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Text(
                        'Please enter the email address associated with your account and we will email you a code to reset your password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Obx(
                        () => textFeild("University Email Address",
                            controller.emailController,
                            validator: (value) =>
                                controller.emailError.value.isEmpty
                                    ? null
                                    : controller.emailError.value,
                            onChanged: (value) =>
                                validateEmail(value, controller.emailError),
                            errorMessage: controller.emailError.value,
                            isEmail: true),
                      ),
                      Obx(
                        () => controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                text: "Submit",
                                onTap: () => controller.emailError.value.isEmpty
                                    ? controller.forgotPassword()
                                    : null),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Resend Code",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
