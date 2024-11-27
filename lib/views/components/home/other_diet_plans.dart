import 'package:flourish/utils/bottom_sheet/other_diets_bottom_sheet.dart';
import 'package:flourish/views/home/home_view.dart';
import 'package:flutter/material.dart';
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
                          name: controller.otherDietPlans[index]['title']!,
                          image: controller.otherDietPlans[index]['image']!,
                          desc: controller.otherDietPlans[index]
                              ['description']!,
                        );
                      },
                    ),
                    isDismissible: false);
              },
              child: ItemsCard(
                  image: controller.otherDietPlans[index]['image']!,
                  text: controller.otherDietPlans[index]['title']!));
        });
  }
}
