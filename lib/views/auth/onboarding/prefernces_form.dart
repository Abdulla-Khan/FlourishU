import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flourish/controllers/auth/onboarding_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import '../../../utils/constants/onboarding_lists.dart';
import '../../components/common/custom_button.dart';
import '../../components/onboarding/appbar.dart';
import '../../components/onboarding/preference_item_builder.dart';

class PreferncesFormView extends GetView<OnboardingController> {
  const PreferncesFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: OnboardingAppBar(
          text: "Preferences",
          onPressed: () {
            log(controller.selectedIndex.toString());
            if (controller.selectedIndex.value <= 0) {
              Get.back();
            } else {
              controller.selectedIndex--;
            }
          }),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
            vertical: context.height * 0.02,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width,
                  height: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5,
                      (index) => Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: index < 4 ? 10 : 0),
                          decoration: BoxDecoration(
                            color: (index <= controller.selectedIndex.value)
                                ? textBtnColor
                                : Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 4,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: context.height * 0.02),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return Stack(
                      children: [
                        FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      ],
                    );
                  },
                  child:
                      _buildPreferenceContent(controller.selectedIndex.value),
                ),
                const Spacer(),
                CustomButton(
                  text: controller.selectedIndex.value != 4 ? 'Next' : "Finish",
                  onTap: () {
                    if (controller.selectedIndex.value < 4) {
                      controller.selectedIndex.value++;
                    } else {
                      controller.makeAPICall();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceContent(int index) {
    switch (index) {
      case 0:
        return PreferencesItemBuilder(
          key: const ValueKey(0), // Unique key for AnimatedSwitcher
          list: preferences1,
          text: "Where do you eat on campus?",
          supportText: "(Select all that apply)",
        );
      case 1:
        return PreferencesItemBuilder(
          key: const ValueKey(1),
          list: preferences2,
          text: "What is your goal?",
          supportText: "",
          isSingleSelect: true,
        );
      case 2:
        return PreferencesItemBuilder(
          key: const ValueKey(2),
          list: preferences3,
          text: "What is your goal of using this app?",
          supportText: "",
        );
      case 3:
        return PreferencesItemBuilder(
          key: const ValueKey(3),
          list: preferences4,
          text: "Do you have any allergies?",
          supportText: "",
          isSingleSelect: true,
          extraItems: allergyItems,
        );
      case 4:
        return PreferencesItemBuilder(
          key: const ValueKey(4),
          list: preferences5,
          text: "How often do you exercise daily?",
          supportText: "",
          extraItems: exerciseItems,
          isSingleSelect: true,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
