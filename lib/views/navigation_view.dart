import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/services/size_service.dart';
import 'package:flourish/views/history/history_view.dart';
import 'package:flourish/views/home/home_view.dart';
import 'package:flourish/views/profile/profile_view.dart';
import 'package:flourish/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomBar(
      width: context.width * 0.9,
      barColor: Colors.transparent,
      body: (context, controller) {
        return widgets[selectedIndex];
      },
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            bottomBarItems(
              icon: Icons.home,
              iconIndex: 0,
              name: "Home",
            ),
            bottomBarItems(
              icon: Icons.account_circle,
              iconIndex: 1,
              name: "Profile",
            ),
            bottomBarItems(
              icon: Icons.history_sharp,
              iconIndex: 2,
              name: "History",
            ),
            bottomBarItems(
              icon: Icons.settings_outlined,
              iconIndex: 3,
              name: "Settings",
            ),
          ],
        ),
      ),
    ));
  }

  Column bottomBarItems({
    required String name,
    required IconData icon,
    required int iconIndex,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: 25,
            color: selectedIndex == iconIndex
                ? textBtnColor
                : Colors.black.withOpacity(0.4),
          ),
          onPressed: () {
            setState(() {
              selectedIndex = iconIndex;
            });
          },
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selectedIndex == iconIndex ? textBtnColor : null,
          ),
          child: Text(
            "  $name  ",
            style: TextStyle(
              color: selectedIndex == iconIndex
                  ? Colors.white
                  : Colors.black.withOpacity(0.4),
              fontSize: 12,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}

List<Widget> widgets = [
  const HomeView(),
  const ProfileView(),
  const HistoryView(),
  const SettingsView()
];
