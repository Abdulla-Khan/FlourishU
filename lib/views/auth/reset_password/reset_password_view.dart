import 'package:flourish/controllers/auth/reset_password_controller.dart';
import 'package:flourish/utils/services/form_validation_service.dart';
import '../../components/common/custom_button.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../utils/constants/colors.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Container(
                height: context.height * 0.55,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: context.width * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Reset Your Password",
                        style: TextStyle(
                          fontSize: 18,
                        )),
                    const Text(
                        "Please enter the code we have sent you on your email address and your new password",
                        style: TextStyle(
                          fontSize: 14,
                        )),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      child: Pinput(
                        onChanged: (value) => controller.otp.value = value,
                        length: 4,
                        defaultPinTheme: PinTheme(
                          width: 55,
                          height: 65,
                          textStyle: const TextStyle(
                              fontSize: 20,
                              color: authTextColor,
                              fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(width: 1, color: authTextColor)),
                        ),
                      ),
                    ),
                    Obx(
                      () => Column(
                        children: [
                          controller.isOtpVerified.value
                              ? Divider(
                                  thickness: 1,
                                  color: Colors.black.withOpacity(0.2),
                                )
                              : const SizedBox.shrink(),
                          controller.isOtpVerified.value
                              ? PasswordFeild(
                                  name: "New Password",
                                  controller: controller.passwordController,
                                  errorMessage: controller.passwordError.value,
                                  validator: (value) =>
                                      controller.passwordError.value.isEmpty
                                          ? null
                                          : controller.passwordError.value,
                                  onChanged: (value) =>
                                      validateCompletePassword(
                                          value, controller.passwordError),
                                )
                              : const SizedBox.shrink(),
                          controller.otp.value.length == 4
                              ? controller.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : CustomButton(
                                      text: "Verify Code",
                                      onTap: () =>
                                          controller.forgotPasswordVerify())
                              : const SizedBox.shrink(),
                          controller.isOtpVerified.value
                              ? controller.isLoading.value
                                  ? const Center(
                                      child: CircularProgressIndicator())
                                  : CustomButton(
                                      text: "Change Password",
                                      onTap: () =>
                                          controller.updateForgotPassword())
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                    const Spacer(),
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
