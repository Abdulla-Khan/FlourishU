import 'package:flutter/material.dart';
import '../../../controllers/onboarding_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/onboarding_lists.dart';

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
      items: studentItems,
    );
  }
}
