import 'package:flourish/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
