import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: context.width * 0.8,
            child: TextField(
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.5),
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: context.height * 0.01, horizontal: 0),
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: "Search Restaurants",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w300,
                  )),
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_sharp,
              color: textBtnColor,
              size: context.height * 0.034,
            ))
      ],
    );
  }
}
