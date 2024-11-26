import 'package:flourish/controllers/customize_diet_plans/customize_diet_plans_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/constants/customize_diet_plan_lists.dart';
import 'package:flourish/views/components/onboarding/preference_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/common/custom_button.dart';
import '../components/customize_diet_plan/appbar.dart';

class CustomizeDietPlansView extends GetView<CustomizeDietPlansController> {
  const CustomizeDietPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizeDietAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  width: context.width,
                  height: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      2,
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
                  text: "Next",
                  onTap: () {
                    if (controller.selectedIndex.value < 1) {
                      controller.selectedIndex.value++;
                    } else {
                      Get.toNamed('/foodDiary');
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
          list: dietplan1,
          text: "Select the number of swipes for your meal plan",
          supportText: "",
        );
      case 1:
        return PreferencesItemBuilder(
          key: const ValueKey(1),
          list: dietplan2,
          text: "What meals do you prefer to eat?",
          supportText: "(Select all that apply)",
          isSingleSelect: true,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
