import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietPlanBottomSheet extends StatelessWidget {
  const DietPlanBottomSheet({
    super.key,
    required this.name,
    required this.desc,
    required this.image,
  });

  final String name;
  final String desc;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
      ),
      // width: context.width,
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
                "\n$name\n",
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
                image,
                width: context.width * 0.8,
              ),
            ),
          ),
          Text(
            "\n$desc",
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
