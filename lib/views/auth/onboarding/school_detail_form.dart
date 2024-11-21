import 'package:flourish/controllers/onboarding_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/common/textfield.dart';
import 'package:flourish/views/auth/login/login_view.dart';
import 'package:flourish/views/auth/onboarding/personal_detail_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
                            for (var i in controller.schoolsList)
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
                        textFeild("GPA", TextEditingController()),
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

class StudentDropDownWidget extends StatelessWidget {
  const StudentDropDownWidget({
    super.key,
    required this.controller,
  });

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: authTextColor,
        size: 24,
      ),
      hint: const Text(
        'Student Status',
        style: TextStyle(
          color: authTextColor,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorStyle: const TextStyle(fontSize: 0.01),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.2),
              style: BorderStyle.solid,
            ),
          ),
          contentPadding: const EdgeInsets.only(bottom: 10, left: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.2), width: 0.8)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide:
                  BorderSide(color: Colors.black.withOpacity(0.2), width: 0.8)),
          labelStyle: const TextStyle(
            color: authTextColor,
            fontWeight: FontWeight.bold,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.2), width: 0.8),
          )),
      dropdownColor: Colors.white,
      value: controller.selectedOption.value == ""
          ? null
          : controller.selectedOption.value,
      onChanged: (value) => controller.selectedOption.value = value!,
      items: controller.studentItems,
    );
  }
}
