import 'dart:developer';
import 'package:flourish/utils/constants/onboarding_lists.dart';
import 'package:flourish/utils/services/api_service.dart';
import 'package:flourish/utils/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/post/update_profile_model.dart';

class OnboardingController extends GetxController {
  TextEditingController gpaController = TextEditingController();
  List preferencesList = [];
  RxString selectedOption = "".obs;
  RxInt currentHeightInInches = 60.obs;
  RxDouble currentWeight = 40.0.obs;
  RxInt selectedIndex = 0.obs;
  RxString dob = "      ".obs;
  DateTime? pickedDate;
  final ApiService apiService = ApiService();

  void toggleSelection(
      String name, List<Map<String, dynamic>> list, String key) {
    for (var item in list) {
      item['isSelected'] = item[key] == name;
    }
  }

  List<String>? getSelectedValues(List<Map<String, dynamic>> list, String key) {
    return list
        .where((item) => item['isSelected'])
        .map((item) => item[key] as String)
        .toList();
  }

  String? getFirstSelectedValue(List<Map<String, dynamic>> list, String key) {
    return list.firstWhere((item) => item['isSelected'], orElse: () => {})[key];
  }

  void selectedSchool(String name) =>
      toggleSelection(name, schoolsList, 'name');

  void selectedGender(String selectedGender) =>
      toggleSelection(selectedGender, genderList, 'gender');

  Future<void> pickDate(BuildContext context) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (date != null) {
      pickedDate = date;
      dob.value = DateFormat('dd MMM yyyy').format(date);
    }
  }

  Future<void> makeAPICall() async {
    String? token = LocalStorageService.getData<String>('auth_token');
    if (token == null) {
      log('Auth token is null');
      return;
    }

    try {
      final profileUpdateRequest = ProfileUpdateRequest(
        gender: getFirstSelectedValue(genderList, 'gender'),
        weight: currentWeight.toInt(),
        height: currentHeightInInches.toInt(),
        eatOptions: getSelectedValues(preferences1, 'value'),
        goal: getFirstSelectedValue(preferences2, 'value'),
        appGoal: getSelectedValues(preferences3, 'value'),
        allergy: getFirstSelectedValue(preferences4, 'value') == "Yes",
        allergyTypes: getSelectedValues(allergyItems, 'value'),
        student: Student(
          school: getFirstSelectedValue(schoolsList, 'name'),
          gpa: gpaController.text,
          status: selectedOption.value,
        ),
        exercise: getFirstSelectedValue(preferences5, 'value'),
        exerciseTypes: getSelectedValues(exerciseItems, 'value'),
        dob: pickedDate?.toIso8601String(),
      );

      final response = await apiService.postRequest(
        authToken: token,
        'user/profile-update',
        profileUpdateRequest.toJson(),
      );

      if (response.statusCode == 200) {
        log('Profile update successful');
      } else {
        log('Profile update failed: ${response.statusCode}');
      }
    } catch (e) {
      log('Error making API call: $e');
    }
  }
}
