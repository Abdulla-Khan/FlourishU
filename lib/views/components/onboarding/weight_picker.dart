import 'package:flourish/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_slider/wheel_slider.dart';
import '../../../utils/constants/colors.dart';

class WeightPicker extends StatelessWidget {
  const WeightPicker({
    super.key,
    required this.controller,
  });

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
