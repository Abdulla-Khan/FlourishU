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
              itemCount: settingItem.length + 1,
              separatorBuilder: (context, index) {
                if (index == 4) {
                  return Divider(
                    thickness: 1,
                    height: context.height * 0.05,
                    color: Colors.black.withOpacity(0.2),
                  );
                }
                return const SizedBox(height: 15);
              },
              itemBuilder: (context, index) => Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    elevation: 3,
                    child: ListTile(
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: Icon(
                          settingItem[index == 0 ? index : index - 1]['icon']),
                      title: Text(
                        settingItem[index == 0 ? index : index - 1]['title'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          height: 0,
                          letterSpacing: 0.14,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}

List settingItem = [
  {"title": "About Us", 'icon': Icons.info_outline_rounded},
  {"title": "Help & Support", 'icon': Icons.headphones},
  {"title": "Privacy Policy", 'icon': Icons.policy_outlined},
  {"title": "Terms and Conditions", 'icon': Icons.edit_document},
  {"title": "Delete Account", 'icon': Icons.delete},
  {"title": "Log Out", 'icon': Icons.logout},
];
