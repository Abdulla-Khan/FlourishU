import 'package:flourish/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PreferencesItemBuilder extends StatelessWidget {
  const PreferencesItemBuilder({
    super.key,
    required this.list,
    required this.text,
    required this.supportText,
    this.isSingleSelect = false,
    this.extraItems = const [],
  });

  final List list;
  final String text;
  final String supportText;
  final bool isSingleSelect;
  final List extraItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              TextSpan(
                text: text,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: supportText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: list.map((item) {
                  return Row(
                    children: [
                      GestureDetector(
                        onTap: isSingleSelect
                            ? () {
                                for (var i in list) {
                                  i['isSelected'] = i['value'] == item['value'];
                                }
                              }
                            : () {
                                item['isSelected'] = !item['isSelected'];
                              },
                        child: AnimatedContainer(
                          width: context.width * 0.045,
                          duration: const Duration(milliseconds: 300),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: item['isSelected']
                                  ? textBtnColor
                                  : Colors.grey,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.all(3),
                          child: Container(
                            width: context.width * 0.045,
                            height: context.height * 0.03,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: item['isSelected']
                                  ? textBtnColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: context.width * 0.03),
                      Text(
                        item['value'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
              SizedBox(height: context.height * 0.02),
              (list[0]['value'] == "Yes" && list[0]['isSelected']) ||
                      (list[0]["value"] == "Never (0 times a week)" &&
                          !list[0]['isSelected'])
                  ? const Text(
                      "Select all that apply",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(height: context.height * 0.02),
              (list[0]['value'] == "Yes" && list[0]['isSelected']) ||
                      (list[0]["value"] == "Never (0 times a week)" &&
                          !list[0]['isSelected'])
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 3,
                      ),
                      itemCount: extraItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(
                          () {
                            final item = extraItems[index];
                            return GestureDetector(
                              onTap: () {
                                item.update('isSelected', (value) => !value);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      item['isSelected'] ? textBtnColor : null,
                                  borderRadius: BorderRadius.circular(25),
                                  border: !item['isSelected']
                                      ? Border.all(
                                          width: 1,
                                          color: Colors.black.withOpacity(0.2),
                                        )
                                      : null,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  item['value'],
                                  style: TextStyle(
                                    color: item['isSelected']
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
