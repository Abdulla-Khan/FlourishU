import 'package:flourish/views/components/customize_diet_plan/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/constants/colors.dart';

class RestaurantsDetailView extends GetView {
  const RestaurantsDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomizeDietAppbar(
        title: "The Silver line Diner",
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height * 0.035,
                child: ListView.separated(
                    itemCount: mealTypes.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) =>
                        SizedBox(width: context.width * 0.02),
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            for (var i in mealTypes) {
                              i['isSelected'] =
                                  i['value'] == mealTypes[index]['value'];
                            }
                          },
                          child: Container(
                              width: context.width * 0.25,
                              decoration: BoxDecoration(
                                color: mealTypes[index]['isSelected']
                                    ? textBtnColor
                                    : null,
                                borderRadius: BorderRadius.circular(25),
                                border: mealTypes[index]['isSelected']
                                    ? null
                                    : Border.all(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.2),
                                      ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                mealTypes[index]['value'],
                                style: TextStyle(
                                  color: !mealTypes[index]['isSelected']
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
              ),
              Container(
                width: context.width,
                margin: EdgeInsets.symmetric(
                  vertical: context.height * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                  vertical: context.height * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
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
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.2)))),
                      child: const Text(
                        'Broiler Works',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const Column(
                      children: [
                        BroilerRow(
                          text: 'Coffee',
                        ),
                        Divider(
                          height: 30,
                        ),
                        BroilerRow(
                          text: 'Almond Milk',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: context.width,
                // height: context.height * 0.2,
                margin: EdgeInsets.symmetric(
                  vertical: context.height * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                  vertical: context.height * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.2)))),
                      child: const Text(
                        'Broiler Works',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    const Column(
                      children: [
                        BroilerRow(
                          text: "OatMeal",
                        ),
                        Divider(
                          height: 30,
                        ),
                        BroilerRow(
                          text: "Eggs White Bites",
                        ),
                        Divider(
                          height: 30,
                        ),
                        BroilerRow(
                          text: "Steak and cheese Protien Bowl",
                        ),
                        Divider(
                          height: 30,
                        ),
                        BroilerRow(
                          text: "Cool Wrap",
                        ),
                        Divider(
                          height: 30,
                        ),
                        BroilerRow(
                          text: "Oatmeal",
                        ),
                        Divider(
                          height: 30,
                        ),
                        BroilerRow(
                          text: "OatMeal",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: context.width,
                margin: EdgeInsets.symmetric(
                  vertical: context.height * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.04,
                  vertical: context.height * 0.03,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.2)))),
                      child: const Text(
                        'Dietary Preferences',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Wrap(
                      spacing: context.width * .1,
                      runSpacing: 20.0, // Space between rows
                      alignment: WrapAlignment.start,
                      children: const [
                        FoodLabel(
                          svgAsset: 'assets/restaurant/leaf.svg',
                          label: "Coolfood",
                        ),
                        FoodLabel(
                          label: "Made Without Gluten",
                          svgAsset: 'assets/restaurant/leaf.svg',
                        ),
                        FoodLabel(
                          label: "Vegetarian",
                          svgAsset: 'assets/restaurant/veg.svg',
                        ),
                        FoodLabel(
                          label: "Local",
                          svgAsset: 'assets/restaurant/location_pin.svg',
                        ),
                        FoodLabel(
                          label: "Vegan",
                          svgAsset: 'assets/restaurant/carrot.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class BroilerRow extends StatelessWidget {
  const BroilerRow({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: context.width * 0.04),
        SvgPicture.asset('assets/svg.svg')
      ],
    );
  }
}

RxList<RxMap<String, dynamic>> mealTypes = [
  {"value": "Breakfast", "isSelected": true}.obs,
  {"value": "Lunch", "isSelected": false}.obs,
  {"value": "Dinner", "isSelected": false}.obs,
].obs;

class FoodLabel extends StatelessWidget {
  final String svgAsset;
  final String label;

  const FoodLabel({
    super.key,
    required this.label,
    required this.svgAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(svgAsset),
        const SizedBox(width: 8), // Space between icon and text
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
