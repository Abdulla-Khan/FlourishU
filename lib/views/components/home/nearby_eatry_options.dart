import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home/home_controller.dart';
import '../../../utils/constants/colors.dart';

class NearbyEatryOptions extends StatelessWidget {
  const NearbyEatryOptions({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.035,
      child: ListView.separated(
        itemCount: controller.nearbyEatriesList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            SizedBox(width: context.width * 0.02),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            for (var i in controller.nearbyEatriesList) {
              i['isSelected'] =
                  i['value'] == controller.nearbyEatriesList[index]['value'];
            }
          },
          child: Obx(
            () => Container(
                width: context.width * 0.25,
                decoration: BoxDecoration(
                  color: controller.nearbyEatriesList[index]['isSelected']
                      ? textBtnColor
                      : null,
                  borderRadius: BorderRadius.circular(25),
                  border: controller.nearbyEatriesList[index]['isSelected']
                      ? null
                      : Border.all(
                          width: 1,
                          color: Colors.black.withOpacity(0.2),
                        ),
                ),
                alignment: Alignment.center,
                child: Text(
                  controller.nearbyEatriesList[index]['value'],
                  style: TextStyle(
                    color: !controller.nearbyEatriesList[index]['isSelected']
                        ? Colors.black
                        : Colors.white,
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
