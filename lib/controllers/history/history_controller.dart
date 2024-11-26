import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryController extends GetxController {
  RxString formattedDate = DateFormat(('d MMM, yyyy')).format(DateTime.now()).obs;
  DateTime currentDate = DateTime.now();

  void incrementDate() {
    currentDate =
        currentDate.add(const Duration(days: 1)); // Assign the new DateTime
    formattedDate.value = DateFormat('d MMM, yyyy').format(currentDate);
  }

  void decrementDate() {
    currentDate = currentDate
        .subtract(const Duration(days: 1)); // Assign the new DateTime
    formattedDate.value = DateFormat('d MMM, yyyy').format(currentDate);
  }
}
