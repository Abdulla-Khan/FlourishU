import 'package:flourish/views/auth/login/login_view.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../utils/constants/colors.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
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
                        height: 130,
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
                        controller: TextEditingController(),
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
                    Divider(
                      thickness: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    PasswordFeild(
                        name: "New Password",
                        controller: TextEditingController()),
                    const Spacer(),
                    CustomButton(text: "Reset Password", onTap: () {})
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
