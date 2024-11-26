import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/common/custom_button.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileView extends GetView {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        surfaceTintColor: bgColor,
        elevation: 0,
        title: const Text(
          'Edit Profile',
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
            textFeild(
              "Name",
              TextEditingController(),
            ),
            textFeild(
              "Email",
              TextEditingController(),
            ),
            textFeild(
              "Phone Number",
              TextEditingController(),
            ),
            const CustomButton(text: 'Save', onTap: null)
          ],
        ),
      )),
    );
  }
}
