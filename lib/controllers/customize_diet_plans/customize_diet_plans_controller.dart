import 'dart:developer';

import 'package:get/get.dart';

class CustomizeDietPlansController extends GetxController {
  RxInt selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    log("initializing");
  }
}
