import 'package:flourish/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomizeDietAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomizeDietAppbar({
    super.key,
    this.title = 'Customize Your Plan',
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      centerTitle: true,
      backgroundColor: bgColor,
      surfaceTintColor: bgColor,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
