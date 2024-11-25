import 'package:flourish/controllers/onboarding_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/constants/onboarding_lists.dart';
import 'package:flourish/views/components/onboarding/gender_card.dart';
import '../../components/common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/onboarding/appbar.dart';
import '../../components/onboarding/height_picker.dart';
import '../../components/onboarding/weight_picker.dart';

class PersonalDetailForm extends GetView<OnboardingController> {
  const PersonalDetailForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: OnboardingAppBar(
          text: "Personal Details",
          showLeading: false,
          onPressed: () => Get.back()),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gender',
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
                for (var i in genderList)
                  GestureDetector(
                    onTap: () => controller.selectedGender(i['gender']),
                    child: Obx(
                      () => GenderCard(
                        isSelected: i['isSelected'],
                        gender: i['gender'],
                      ),
                    ),
                  )
              ],
            ),
            Divider(
              thickness: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date of Birth',
                  style: TextStyle(
                    color: Color(0xFF6C7278),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                IconButton(
                    onPressed: () => controller.pickDate(context),
                    icon: const Icon(
                      Icons.date_range,
                      color: textBtnColor,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: context.width * 0.2,
                  height: context.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Text(controller.dob.value.split(' ')[0]),
                ),
                Container(
                  width: context.width * 0.05,
                  height: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
                Container(
                  width: context.width * 0.2,
                  height: context.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Text(controller.dob.value.split(' ')[1]),
                ),
                Container(
                  width: context.width * 0.05,
                  height: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
                Container(
                  width: context.width * 0.3,
                  height: context.height * 0.05,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: Text(controller.dob.value.split(' ')[2]),
                )
              ],
            ),
            HeightPicker(controller: controller),
            WeightPicker(controller: controller),
            CustomButton(
                text: 'Next',
                onTap: () => Get.toNamed(
                      "/schoolInfo",
                    )),
          ],
        ),
      )),
    );
  }
}
