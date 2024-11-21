import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flourish/controllers/onboarding_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/auth/login/login_view.dart';
import 'package:flourish/views/auth/onboarding/personal_detail_form.dart';

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
                    } else {}
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
          list: controller.preferences1,
          text: "Where do you eat on campus?",
          supportText: "(Select all that apply)",
        );
      case 1:
        return PreferencesItemBuilder(
          key: const ValueKey(1),
          list: controller.preferences2,
          text: "What is your goal?",
          supportText: "",
        );
      case 2:
        return PreferencesItemBuilder(
          key: const ValueKey(2),
          list: controller.preferences3,
          text: "What is your goal of using this app?",
          supportText: "",
        );
      case 3:
        return PreferencesItemBuilder(
          key: const ValueKey(3),
          list: controller.preferences4,
          text: "Do you have any allergies?",
          supportText: "",
          isSingleSelect: true,
          extraItems: controller.allergyItems,
        );
      case 4:
        return PreferencesItemBuilder(
          key: const ValueKey(4),
          list: controller.preferences5,
          text: "How often do you exercise daily?",
          supportText: "",
          extraItems: controller.exerciseItems,
          isSingleSelect: true,
        );
      default:
        return const SizedBox.shrink(); // Placeholder for safety
    }
  }
}

class PreferencesItemBuilder extends StatelessWidget {
  const PreferencesItemBuilder({
    super.key,
    required this.list,
    required this.text,
    required this.supportText,
    this.isSingleSelect = false,
    this.extraItems = const [],
  });

  final List list;
  final String text;
  final String supportText;
  final bool isSingleSelect;
  final List extraItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: supportText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: list.map((item) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: isSingleSelect
                            ? () {
                                for (var i in list) {
                                  i['isSelected'] = i['value'] == item['value'];
                                }
                              }
                            : () {
                                item['isSelected'] = !item['isSelected'];
                              },
                        child: AnimatedContainer(
                          width: context.width * 0.045,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: item['isSelected']
                                  ? textBtnColor
                                  : Colors.grey,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            width: context.width * 0.045,
                            height: context.height * 0.03,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: item['isSelected']
                                  ? textBtnColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: context.width * 0.03),
                      Text(
                        item['value'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: context.height * 0.02),
              (list[0]['value'] == "Yes" && list[0]['isSelected']) ||
                      (list[0]["value"] == "Never (0 times a week)" &&
                          !list[0]['isSelected'])
                  ? const Text(
                      "Select all that apply",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: context.height * 0.02),
              (list[0]['value'] == "Yes" && list[0]['isSelected']) ||
                      (list[0]["value"] == "Never (0 times a week)" &&
                          !list[0]['isSelected'])
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 3,
                      ),
                      itemCount: extraItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(
                          () {
                            final item = extraItems[index];
                            return GestureDetector(
                              onTap: () {
                                item.update('isSelected', (value) => !value);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      item['isSelected'] ? textBtnColor : null,
                                  borderRadius: BorderRadius.circular(25),
                                  border: !item['isSelected']
                                      ? Border.all(
                                          width: 1,
                                          color: Colors.black.withOpacity(0.2),
                                        )
                                      : null,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  item['value'],
                                  style: TextStyle(
                                    color: item['isSelected']
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
