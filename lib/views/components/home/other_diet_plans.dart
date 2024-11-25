import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';

class OtherDietPlansList extends StatelessWidget {
  const OtherDietPlansList({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: controller.otherDietPlans.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.bottomSheet(
                BottomSheet(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  onClosing: () {},
                  builder: (ctx) {
                    return DietPlanBottomSheet(
                        controller: controller, index: index);
                  },
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
              height: context.height * 0.08,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 20,
                  )
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      controller.otherDietPlans[index]['image']!,
                      fit: BoxFit.cover,
                      width: context.width * 0.15,
                    ),
                  ),
                  Text(
                    "   ${controller.otherDietPlans[index]['title']!}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class DietPlanBottomSheet extends StatelessWidget {
  const DietPlanBottomSheet({
    super.key,
    required this.controller,
    required this.index,
  });

  final HomeController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
      ),
      width: context.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\n${controller.otherDietPlans[index]['title']}\n",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                  onPressed: () => Get.back(), icon: const Icon(Icons.close))
            ],
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                controller.otherDietPlans[index]['image']!,
                width: context.width * 0.8,
              ),
            ),
          ),
          Text(
            "\n${controller.otherDietPlans[index]['description']!}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
