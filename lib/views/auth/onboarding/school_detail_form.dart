import 'package:flourish/controllers/auth/onboarding_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/constants/onboarding_lists.dart';
import 'package:flourish/views/components/onboarding/student_dropdown.dart';
import 'package:flourish/views/components/common/textfield.dart';
import '../../components/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/onboarding/appbar.dart';

class SchoolDetailForm extends GetView<OnboardingController> {
  const SchoolDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: OnboardingAppBar(
          text: "Personal Details", onPressed: () => Get.back()),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
        ),
        child: SafeArea(
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: context.height * 0.4,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'School',
                          style: TextStyle(
                            color: Color(0xFF6C7278),
                            fontSize: 18,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            for (var i in schoolsList)
                              InkWell(
                                onTap: () =>
                                    controller.selectedSchool(i['name']),
                                child: Container(
                                  width: context.width * 0.28,
                                  height: context.height * 0.13,
                                  decoration: BoxDecoration(
                                    color: i['isSelected'] == true
                                        ? Colors.white
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                    boxShadow: i['isSelected'] == true
                                        ? [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                spreadRadius: 2)
                                          ]
                                        : null,
                                  ),
                                  child: Column(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/onboarding/schools/${i['name'].toString().toLowerCase()}.svg',
                                        height: context.height * 0.1,
                                      ),
                                      Text(
                                        i["name"]!.toString(),
                                        style: const TextStyle(
                                          color: authTextColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          height: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.black.withOpacity(0.2),
                        ),
                        StudentDropDownWidget(controller: controller),
                        textFeild("GPA", controller.gpaController),
                      ]),
                ),
                const Spacer(),
                CustomButton(
                    text: "Next", onTap: () => Get.toNamed("/preferences"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
