import 'package:flourish/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
    this.text = "Preferences",
    this.showLeading = true,
    required this.onPressed,
  });
  final String text;
  final bool showLeading;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      surfaceTintColor: bgColor,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showLeading
          ? IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            )
          : null,
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0),
          child: Hero(
              tag: "auth-logo",
              child: SvgPicture.asset('assets/logo/logo-sm.svg')),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
