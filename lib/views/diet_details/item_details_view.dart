import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../components/customize_diet_plan/appbar.dart';

class ItemDetailsView extends GetView {
  const ItemDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomizeDietAppbar(
        title: "Breakfast",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/breakfast.png',
                    fit: BoxFit.cover,
                    width: context.width,
                    height: context.height * 0.2,
                  ),
                ),
                SizedBox(height: context.height * 0.01),
                const Text(
                  'Coffee',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: textBtnColor,
                      size: 20,
                    ),
                    Text(
                      'Starbucks',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.height * 0.01),
                const Divider(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Calories',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/calories.svg'),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: ' 438.0 ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'kcal',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  height: 30,
                ),
                const Text(
                  'Nutrients Details',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.height * 0.01),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CaloriesIndicator(
                      footerText: 'Protein/cal',
                      percent: 0.5,
                      color: Color(0xFFFCA33A),
                    ),
                    CaloriesIndicator(
                      footerText: 'Fats/cal',
                      percent: 0.1412,
                      color: Color(0xFF666CFF),
                    ),
                    CaloriesIndicator(
                      footerText: 'Carbs/cal',
                      percent: 0.7401,
                      color: Color(0xFF37AA95),
                    ),
                  ],
                ),
                const Divider(
                  height: 30,
                ),
                const Text(
                  'Indgredients',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: context.height * 0.01),
                const ItemsCard(image: 'assets/egg.png', text: "   Whole Egg"),
                const ItemsCard(image: 'assets/oil.png', text: "   Canola Oil"),
                const ItemsCard(
                    image: 'assets/clove.png', text: "   Ground Black Pepper"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CaloriesIndicator extends StatelessWidget {
  const CaloriesIndicator({
    super.key,
    required this.footerText,
    required this.percent,
    required this.color,
  });

  final String footerText;
  final double percent;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 60.0,
      lineWidth: 8,
      percent: percent,
      center: Text(
        '${(percent * 100).toStringAsFixed(1)}%',
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      backgroundColor: Colors.black.withOpacity(0.2),
      progressColor: color,
      footer: Text(
        footerText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
