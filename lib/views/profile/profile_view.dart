// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/views/components/onboarding/appbar.dart';

class ProfileView extends GetView {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const OnboardingAppBar(
        onPressed: null,
        showLeading: false,
        text: "Profile",
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.04,
              ),
              color: Colors.white,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: bgColor,
                    child: Image.asset(
                      "assets/test.png",
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '   Sonu Singh',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '     sonusingh0000@gmail.com',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.04,
              ),
              child: const Text(
                'Account Settings',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
            const ProfileListViewBuilder(
              list: accountSettingsList,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.04,
              ),
              child: const Text(
                'Dietry Preferences',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const ProfileListViewBuilder(
              list: dietryPreferences,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileListViewBuilder extends StatelessWidget {
  const ProfileListViewBuilder({
    super.key,
    required this.list,
  });
  final List list;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
      ),
      child: ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              titleAlignment: ListTileTitleAlignment.threeLine,
              leading: const Icon(
                Icons.account_box_outlined,
              ),
              title: Text(
                list[index]["title"],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                list[index]["subtitle"],
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w300,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
              ),
            );
          }),
    );
  }
}

const List accountSettingsList = [
  {
    "title": "Personal Details",
    "subtitle": "Update your height, weight, age, gpa and more"
  },
  {"title": "Change Password", "subtitle": "Change your Profile Password"}
];

const List dietryPreferences = [
  {"title": "My Preferences", "subtitle": "Update your Preferences"},
  {
    "title": "Favourite Food / Resturants",
    "subtitle": "Check What you’ve selected"
  }
];
