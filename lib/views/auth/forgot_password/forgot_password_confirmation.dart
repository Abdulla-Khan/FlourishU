import '../../components/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ForgotPasswordConfirmation extends StatelessWidget {
  const ForgotPasswordConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/onboarding/confirm.svg'),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const Text(
                      'Request sent successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      'We have sent an email with verification code to',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.8,
                      child: const Wrap(
                        alignment: WrapAlignment.spaceAround,
                        children: [
                          Text(
                            'xyz@helloworld.com',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF91A93E),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Please check your email.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    CustomButton(
                      text: 'Continue',
                      onTap: () => Get.toNamed('/resetPassword'),
                      width: context.width * 0.4,
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
