import 'package:get/get.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  final Rx<DateTime> currentTime = DateTime.now().obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    // Update time every second
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime.value = DateTime.now();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  String getFormattedDate() {
    // "Rabu, 19 Maret 2025"
    return DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(currentTime.value);
  }

  String getFormattedTime() {
    // "06:38:47 PM"
    return DateFormat('hh:mm:ss a').format(currentTime.value);
  }

  void onRefreshPressed() {
    // Implement refresh functionality
    Get.snackbar(
      'Refresh',
      'Refreshing data...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onAddButtonPressed() {
    // Navigate to registration page
    // Get.toNamed(Routes.REGISTRATION);
  }
}