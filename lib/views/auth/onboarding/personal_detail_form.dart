import 'package:flourish/controllers/onboarding_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wheel_slider/wheel_slider.dart';

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
                for (var i in controller.genderList)
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: context.width * 0.2,
                  height: context.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.05,
                  height: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
                Container(
                  width: context.width * 0.2,
                  height: context.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                ),
                Container(
                  width: context.width * 0.05,
                  height: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
                Container(
                  width: context.width * 0.3,
                  height: context.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: context.width,
              height: context.height * 0.2,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Height',
                    style: TextStyle(
                      color: Color(0xFF6C7278),
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(
                          () => Text(
                            "${controller.currentHeightInInches ~/ 12}.${controller.currentHeightInInches % 12}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Text(
                          'ft',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  WheelSlider(
                    interval: 1,
                    totalCount: 120,
                    initValue: controller.currentHeightInInches.toDouble(),
                    isInfinite: false,
                    onValueChanged: (val) {
                      controller.currentHeightInInches.value = val.toInt();
                    },
                    pointerColor: const Color(0xFF7D8757),
                    lineColor: authTextColor,
                    hapticFeedbackType: HapticFeedbackType.vibrate,
                  ),
                ],
              ),
            ),
            Container(
              width: context.width,
              height: context.height * 0.2,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weight',
                    style: TextStyle(
                      color: Color(0xFF6C7278),
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Obx(
                          () => Text(
                            controller.currentWeight.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        const Text(
                          'kgs',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  WheelSlider(
                    interval: 0.1,
                    totalCount: 1200,
                    initValue: controller.currentWeight.value,
                    isInfinite: false,
                    onValueChanged: (val) {
                      controller.currentWeight.value = val;
                    },
                    pointerColor: const Color(0xFF7D8757),
                    lineColor: authTextColor,
                    hapticFeedbackType: HapticFeedbackType.vibrate,
                  ),
                ],
              ),
            ),
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

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
    this.text = "Preferences",
    this.showLeading = true,
    required this.onPressed,
  });
  final String text;
  final bool showLeading;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      surfaceTintColor: bgColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showLeading
          ? IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            )
          : null,
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Hero(
              tag: "auth-logo",
              child: SvgPicture.asset('assets/logo/logo-sm.svg')),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.isSelected,
    required this.gender,
  });
  final bool isSelected;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      height: context.height * 0.18,
      decoration: BoxDecoration(
        color: isSelected ? textBtnColor : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/onboarding/${gender.toLowerCase()}.svg'),
          Text(
            gender,
            style: TextStyle(
              color: isSelected ? const Color(0xFFECEFBB) : authTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
