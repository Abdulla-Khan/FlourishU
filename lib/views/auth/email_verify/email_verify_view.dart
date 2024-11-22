import 'package:flourish/utils/constants/colors.dart';

import '../../components/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/email_verify_controller.dart';

class EmailVerifyView extends GetView<EmailVerifyController> {
  const EmailVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Hero(
                  tag: "auth-logo",
                  child: SvgPicture.asset(
                    'assets/logo/logo.svg',
                    height: context.height * 0.14,
                  ),
                ),
              ),
              const Text(
                '\nCheck Your Email',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
              const Text(
                'We sent a verification code to xyz@helloworld.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 50),
                alignment: Alignment.center,
                child: Pinput(
                  controller: TextEditingController(),
                  length: 4,
                  separatorBuilder: (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 10,
                    height: 1,
                    color: authTextColor,
                  ),
                  defaultPinTheme: PinTheme(
                    width: 55,
                    height: 65,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        color: authTextColor,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: authTextColor)),
                  ),
                ),
              ),
              CustomButton(
                text: "Verify Email",
                onTap: () => Get.toNamed("/personalInfo"),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
