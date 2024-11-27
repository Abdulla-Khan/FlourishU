import 'package:flourish/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../components/onboarding/appbar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: OnboardingAppBar(
        onPressed: () => Get.back(),
        // showLeading: false,
        text: "About Us",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/about-us.svg',
                    width: context.width * 0.6,
                  ),
                ),
                const Text(
                  '\n\nOn the other hand, we denounce with righteous indignation and dislike men who are so charms ofleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain  frequently circumstances and owing to the claims of doptio cumque nihil impedit quo minus id quod maxime placeat facere possimus.\n\nOn the other hand, we denounce with righteous indignation and dislike men who are so charms ofleasure of the moment, so blinded by desire, that they cannot foresee will, which is the same as saying through quod maxime placeat facere possimus will,blinded by desire, that they cannot foresee which is the same as On the other hand, we denounce with righteous saying desire, that they cannot foresee which is the same as On the other hand, we denounce with righteous sayingthrough denounce with,\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s hidden in the middle of text. All the Lorem Ipsum. ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
