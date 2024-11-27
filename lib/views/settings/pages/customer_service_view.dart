import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/onboarding/appbar.dart';
import 'package:flourish/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerServiceView extends StatelessWidget {
  const CustomerServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: OnboardingAppBar(
        onPressed: () => Get.back(),
        text: "Help & Support",
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
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/customer.png',
                        width: context.width * 0.5,
                      ),
                      SizedBox(
                        width: context.width * 0.5,
                        child: const Text(
                          'Hello, How can we help you?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  "\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularisez Lorem Ipsum is simply dummy text of the printing and hidden in the middle of text. All the Lorem Ipsum.\n\n",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: context.height * 0.1),
                const SettingsCard(
                    icon: Icons.email, title: "Sent us an email", route: ''),
                SizedBox(height: context.height * 0.02),
                const SettingsCard(
                  icon: Icons.phone,
                  title: "Contact Us",
                  route: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
