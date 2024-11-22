import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/services/size_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.isSelected,
    required this.gender,
  });
  final bool isSelected;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      height: context.height * 0.18,
      decoration: BoxDecoration(
        color: isSelected ? textBtnColor : null,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset('assets/onboarding/${gender.toLowerCase()}.svg'),
          Text(
            gender,
            style: TextStyle(
              color: isSelected ? const Color(0xFFECEFBB) : authTextColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
