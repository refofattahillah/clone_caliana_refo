import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/feature_section_controller.dart';
import '../controllers/floating_action_menu_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<FeatureSectionController>(
      () => FeatureSectionController(),
    );
    Get.lazyPut<FloatingActionMenuController>(
      () => FloatingActionMenuController(),
    );
  }
}