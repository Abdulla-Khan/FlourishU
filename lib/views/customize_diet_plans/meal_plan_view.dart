import 'package:flourish/views/components/common/custom_button.dart';
import 'package:flourish/views/customize_diet_plans/food_diary_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/customize_diet_plan_lists.dart';
import '../components/customize_diet_plan/appbar.dart';

class MealPlanView extends GetView {
  const MealPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomizeDietAppbar(
        title: "Your Meal Plan",
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
                const CalorieCounterCard(),
                for (var i in foodOption)
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: context.height * 0.01,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: context.height * 0.01,
                    ),
                    // height: context.height * 0.15,
                    width: context.width,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '  ${i['value']}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const MenuItemsCard(),
                        const MenuItemsCard(),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
        ),
        child: CustomButton(text: "Confirm", onTap: () {}),
      ),
    );
  }
}

class CalorieCounterCard extends StatelessWidget {
  const CalorieCounterCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height * 0.15,
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
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
            'Calories Remaining',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: context.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildColumn("Goal", "3,050", Colors.black),
                const Text(
                  "-",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _buildColumn("Food", "1,833", Colors.black),
                const Text(
                  "=",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                _buildColumn(
                    "Remaining", "1,217", 121 >= 0 ? textBtnColor : Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildColumn(String label, String value, Color valueColor) {
  return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: valueColor,
        ),
      ),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
      ),
    ],
  );
}

class WeekDaysListBuilder extends StatelessWidget {
  const WeekDaysListBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.035,
      child: ListView.separated(
          itemCount: weekDays.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              SizedBox(width: context.width * 0.02),
          itemBuilder: (context, index) {
            return Obx(
              () => GestureDetector(
                onTap: () {
                  for (var i in weekDays) {
                    i['isSelected'] = i['value'] == weekDays[index]['value'];
                  }
                },
                child: Container(
                    width: context.width * 0.25,
                    decoration: BoxDecoration(
                      color:
                          weekDays[index]['isSelected'] ? textBtnColor : null,
                      borderRadius: BorderRadius.circular(25),
                      border: weekDays[index]['isSelected']
                          ? null
                          : Border.all(
                              width: 1,
                              color: Colors.black.withOpacity(0.2),
                            ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      weekDays[index]['value'],
                      style: TextStyle(
                        color: !weekDays[index]['isSelected']
                            ? Colors.black
                            : Colors.white,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    )),
              ),
            );
          }),
    );
  }
}
