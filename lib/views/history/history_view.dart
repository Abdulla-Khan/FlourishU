import 'package:flourish/controllers/history/history_controller.dart';
import 'package:flourish/utils/constants/colors.dart';
import 'package:flourish/utils/constants/customize_diet_plan_lists.dart';
import 'package:flourish/views/components/onboarding/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: const OnboardingAppBar(
        onPressed: null,
        showLeading: false,
        text: "History",
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DatePickerContainer(
                controller: controller,
              ),
              SizedBox(height: context.height * 0.03),
              ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: weekDays.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.height * 0.02),
                  itemBuilder: (context, index) {
                    return Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      elevation: 3,
                      child: ListTile(
                        tileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        title: Text(
                          weekDays[index]['value'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Obx(
                          () => Text(
                            controller.formattedDate.value,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        trailing: SizedBox(
                          width: context.width * 0.2,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'View More',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: textBtnColor,
                                  fontSize: 14,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14,
                                color: textBtnColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class DatePickerContainer extends StatelessWidget {
  const DatePickerContainer({
    super.key,
    required this.controller,
  });
  final HistoryController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.6,
      height: context.height * 0.04,
      child: Obx(
        () => Row(
          children: [
            GestureDetector(
              onTap: () {
                controller.decrementDate();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                height: context.height,
                decoration: const BoxDecoration(
                    color: textBtnColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8))),
                child: const Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: context.width * 0.4,
              height: context.height,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: textBtnColor,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                controller.formattedDate.value,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.incrementDate();
              },
              child: Container(
                height: context.height,
                decoration: const BoxDecoration(
                    color: textBtnColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8))),
                child: const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
            // Icon(
            //   Icons.calendar_month_outlined,
            //   color: Colors.red,
            //   size: 30,
            // ),
          ],
        ),
      ),
    );
  }
}
