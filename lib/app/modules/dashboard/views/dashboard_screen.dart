import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/floating_action_menu_controller.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/bottom_nav_bar_widget.dart';
import 'widgets/feature_grid_widget.dart';
import 'widgets/feature_section_widget.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/today_section_widget.dart';
import 'widgets/floating_action_menu.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final menuController = Get.find<FloatingActionMenuController>();

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarWidget(),
                _buildTimeDisplay(controller),
                SearchBarWidget(),
                FeatureSectionWidget(),
                FeatureGridWidget(),
                const SizedBox(height: 20),
                TodaySectionWidget(),
              ],
            ),
          ),
          // Full screen overlay for the floating action menu
          Obx(() {
            if (menuController.isMenuOpen.value) {
              return FloatingActionMenu();
            } else {
              return const SizedBox.shrink();
            }
          }),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }

  Widget _buildTimeDisplay(DashboardController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.getFormattedDate(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              controller.getFormattedTime(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      }),
    );
  }
}