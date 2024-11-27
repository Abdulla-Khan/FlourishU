import 'package:flutter/material.dart';
import 'package:get/utils.dart';

import '../../../utils/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.width,
      this.color = textBtnColor,
      this.textColor = Colors.white,
      this.showIcon = false,
      this.borderColor});
  final String text;
  final Function()? onTap;
  final double? width;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: context.height * 0.055,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(32),
            border: Border.all(
              color: borderColor ?? color,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            showIcon
                ? const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 14,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
