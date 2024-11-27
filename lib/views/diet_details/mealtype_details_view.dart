import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../components/customize_diet_plan/appbar.dart';

class MealtypeDetailsView extends GetView {
  const MealtypeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomizeDietAppbar(
        title: "Breakfast Items",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (ctx, index) => Container(
              alignment: Alignment.center,
              height: context.height * 0.08,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        itemsList[index],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: context.width * 0.03),
                      SvgPicture.asset('assets/svg.svg')
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List itemsList = ["Coffee", "Almonds", "Oatmilk"];
