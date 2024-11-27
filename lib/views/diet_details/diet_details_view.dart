import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/customize_diet_plan/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietDetailsView extends GetView {
  const DietDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomizeDietAppbar(
        title: "Healthy Diet",
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.04,
        ),
        child: ListView.builder(
          itemCount: dietList.length,
          itemBuilder: (ctx, index) => Container(
            alignment: Alignment.center,
            height: context.height * 0.124,
            margin: EdgeInsets.symmetric(
              vertical: context.height * 0.01,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.02,
              vertical: context.height * 0.02,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                )
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    dietList[index]['image'],
                    fit: BoxFit.fill,
                    width: context.width * 0.2,
                    height: context.height * 0.09,
                  ),
                ),
                SizedBox(width: context.width * 0.03),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dietList[index]['title'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          color: textBtnColor,
                          size: 16,
                        ),
                        Text(
                          dietList[index]['location'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          color: textBtnColor,
                          size: 16,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: dietList[index]['hour'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' | ',
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.20000000298023224),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const TextSpan(
                                text: ' 1 / 12 / 2024',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

List<Map> dietList = [
  {
    "title": "Breakfast",
    "location": "Starbucks",
    "hour": " 07:00 am",
    "image": "assets/breakfast.png"
  },
  {
    "title": "Lunch",
    "location": "Subway",
    "hour": " 02:00 am",
    "image": "assets/healthy-diet.png"
  },
  {
    "title": "Dinner",
    "location": "The Cafe",
    "hour": " 12:00 am",
    "image": "assets/dinner.png"
  },
  {
    "title": "Snacks",
    "location": "Chick Fil A",
    "hour": " 08:00 am",
    "image": "assets/snack.png"
  },
];
