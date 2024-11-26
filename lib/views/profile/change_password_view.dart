import 'package:flourish/views/components/common/custom_button.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';

class ChangePasswordView extends GetView {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        surfaceTintColor: bgColor,
        elevation: 0,
        title: const Text(
          'Change Password',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Column(
            children: [
              PasswordFeild(
                  name: 'Current Password',
                  controller: TextEditingController(),
                  errorMessage: ''),
              PasswordFeild(
                  name: 'New Password',
                  controller: TextEditingController(),
                  errorMessage: ''),
              PasswordFeild(
                  name: 'Confirm New Password',
                  controller: TextEditingController(),
                  errorMessage: ''),
              const CustomButton(text: "Update Password", onTap: null)
            ],
          ),
        ),
      ),
    );
  }
}
