import 'package:flourish/controllers/customize_diet_plans/customize_diet_plans_controller.dart';
import 'package:flourish/utils/constants/customize_diet_plan_lists.dart';
import 'package:flourish/views/components/common/custom_button.dart';
import 'package:flourish/views/customize_diet_plans/meal_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../components/customize_diet_plan/appbar.dart';

class FoodDiaryView extends GetView<CustomizeDietPlansController> {
  const FoodDiaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomizeDietAppbar(
        title: "Your Food Diary For",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const WeekDaysListBuilder(),
                Divider(
                  thickness: 1,
                  height: context.height * 0.05,
                  color: Colors.black.withOpacity(0.2),
                ),
                for (var i in foodOption)
                  Obx(
                    () => Container(
                      width: context.width,
                      height: i['isSelected']
                          ? context.height * 0.6
                          : context.height * 0.055,
                      margin: EdgeInsets.symmetric(
                          vertical: context.height * 0.008),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1.5, color: Colors.black.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.height * 0.01),
                                child: Text(
                                  '  ${i['value']}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              IconButton(
                                style: const ButtonStyle(
                                  padding: WidgetStatePropertyAll<EdgeInsets>(
                                    EdgeInsets.zero,
                                  ),
                                ),
                                onPressed: () {
                                  i['isSelected'] = !i['isSelected'];
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: 35,
                                ),
                              ),
                            ],
                          ),
                          i["isSelected"]
                              ? const MenuItemsCard(
                                  showCloseButton: false,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: context.height * 0.25,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
          )
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
              width: context.width * 0.8,
              height: context.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const DietCaloriesColumn(
                          text: "Calories",
                          value: "200",
                        ),
                        Container(
                          width: 1,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        const DietCaloriesColumn(
                          text: "Carbs",
                          value: "0",
                        ),
                        Container(
                          width: 1,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        const DietCaloriesColumn(
                          text: "Fat",
                          value: "15",
                        ),
                        Container(
                          width: 1,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        const DietCaloriesColumn(
                          text: "Protien",
                          value: "14",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Back to home",
                  onTap: () {},
                  width: context.width * 0.36,
                  color: Colors.white,
                  textColor: Colors.black,
                  borderColor: Colors.black.withOpacity(0.2),
                ),
                CustomButton(
                  text: "Add to Meal Plan",
                  onTap: () => Get.toNamed('/mealPlan'),
                  width: context.width * 0.36,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuItemsCard extends StatelessWidget {
  const MenuItemsCard({
    super.key,
    this.showCloseButton = true,
  });
  final bool showCloseButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.height * 0.01, horizontal: context.width * 0.03),
      padding: EdgeInsets.symmetric(
          vertical: context.height * 0.01, horizontal: context.width * 0.03),
      width: context.width,
      height: context.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: showCloseButton ? context.width * 0.8 : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Scarmbkled Eggs',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        showCloseButton
                            ? const Icon(
                                Icons.close,
                                size: 16,
                              )
                            : const SizedBox.shrink()
                      ],
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: textBtnColor,
                        size: 20,
                      ),
                      Text(
                        '704 Social',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.black.withOpacity(0.2),
          ),
          SizedBox(
            height: context.height * 0.06,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const DietCaloriesColumn(text: "Quantity", value: '1/2 cups'),
                Container(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
                const DietCaloriesColumn(
                  text: "Calories",
                  value: "200",
                ),
                Container(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
                const DietCaloriesColumn(
                  text: "Carbs",
                  value: "0",
                ),
                Container(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
                const DietCaloriesColumn(
                  text: "Fat",
                  value: "15",
                ),
                Container(
                  width: 1,
                  color: Colors.black.withOpacity(0.3),
                ),
                const DietCaloriesColumn(
                  text: "Protien",
                  value: "14",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DietCaloriesColumn extends StatelessWidget {
  const DietCaloriesColumn({
    super.key,
    required this.text,
    required this.value,
  });
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
