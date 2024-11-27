import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/colors.dart';
import '../components/onboarding/appbar.dart';

class SettingsView extends GetView {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const OnboardingAppBar(
        onPressed: null,
        showLeading: false,
        text: "Settings",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: settingItem.length,
              separatorBuilder: (context, index) {
                if (index == 3) {
                  return Divider(
                    thickness: 1,
                    height: context.height * 0.05,
                    color: Colors.black.withOpacity(0.2),
                  );
                }
                return const SizedBox(height: 15);
              },
              itemBuilder: (context, index) => SettingsCard(
                    icon: settingItem[index]['icon'],
                    title: settingItem[index]['title'],
                    route: settingItem[index]['route'],
                  )),
        ),
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
  });
  final IconData icon;
  final String title;
  final String route;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: ListTile(
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            height: 0,
            letterSpacing: 0.14,
          ),
        ),
        trailing: IconButton(
          onPressed: () => Get.toNamed(route),
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
          ),
        ),
      ),
    );
  }
}

List settingItem = [
  {
    "title": "About Us",
    'icon': Icons.info_outline_rounded,
    'route': '/about-us'
  },
  {
    "title": "Help & Support",
    'icon': Icons.headphones,
    'route': '/customer-support'
  },
  {
    "title": "Privacy Policy",
    'icon': Icons.policy_outlined,
    'route': '/privacy-policy'
  },
  {
    "title": "Terms and Conditions",
    'icon': Icons.edit_document,
    'route': '/terms&conditions'
  },
  {
    "title": "Delete Account",
    'icon': Icons.delete,
    'route': '/terms&conditions'
  },
  {
    "title": "Log Out",
    'icon': Icons.logout,
    'route': '/terms&conditions',
  },
];
