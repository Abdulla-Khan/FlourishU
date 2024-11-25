import 'dart:developer';
import 'package:flourish/model/post/update_profile_model.dart';
import 'package:flourish/utils/constants/onboarding_lists.dart';
import 'package:flourish/utils/services/api_service.dart';
import 'package:flourish/utils/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

  void selectedSchool(String name) {
    for (var school in schoolsList) {
      school['isSelected'] = school['name'] == name;
    }
  }

  void selectedGender(String selectedGender) {
    for (var gender in genderList) {
      gender['isSelected'] = gender['gender'] == selectedGender;
    }
  }

  pickDate(
    context,
  ) async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      dob.value = DateFormat('dd MMM yyyy').format(pickedDate!);
    }
  }

  Future<void> makeAPICall() async {
    String token = LocalStorageService.getData<String>('auth_token')!;
    String userId = JwtDecoder.decode(token)['_id'];
    log(userId);
    log(token);
    try {
      String? allergy = preferences4.firstWhere(
        (element) => element['isSelected'],
      )['value'];

      String? exercise = preferences5.firstWhere(
        (element) => element['isSelected'],
      )['value'];

      final profileUpdateRequest = ProfileUpdateRequest(
        gender: genderList.firstWhere(
          (element) => element['isSelected'],
        )['gender'],
        weight: currentWeight.toInt(),
        height: currentHeightInInches.toInt(),
        eatOptions: preferences1
            .where((element) =>
                element['isSelected']) // Filters only selected items
            .map((element) =>
                element['value'] as String) // Extracts the 'gender' value
            .toList(),
        goal: preferences2.firstWhere(
          (element) => element['isSelected'],
        )['value'],
        appGoal: preferences3
            .where((element) =>
                element['isSelected']) // Filters only selected items
            .map((element) =>
                element['value'] as String) // Extracts the 'gender' value
            .toList(),
        allergy: allergy == "Yes",
        allergyTypes: allergy == "No"
            ? null
            : allergyItems
                .where((element) =>
                    element['isSelected']) // Filters only selected items
                .map((element) => element['value'] as String)
                .toList(),
        student: Student(
          school: schoolsList.firstWhere(
            (element) => element['isSelected'],
          )['name'],
          gpa: gpaController.text,
          status: selectedOption.value,
        ),
        exercise: exercise,
        exerciseTypes: exercise == "Never (0 times a week)"
            ? null
            : exerciseItems
                .where((element) =>
                    element['isSelected']) // Filters only selected items
                .map((element) => element['value'] as String)
                .toList(),
        dob: pickedDate?.toIso8601String(),
      );

      final response = await apiService.multipartPutRequest(
        authToken: token,
        endpoint: 'user/profile-update?id=$userId',
        body: profileUpdateRequest.toJson(),
        files: {},
      );
      log(response.reasonPhrase.toString());
    } catch (e) {}
  }
}
