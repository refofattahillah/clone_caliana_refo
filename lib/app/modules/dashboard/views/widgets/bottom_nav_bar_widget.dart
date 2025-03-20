import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/dashboard_controller.dart';
import '../../controllers/floating_action_menu_controller.dart';
import '../../../../themes/theme.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final menuController = Get.find<FloatingActionMenuController>();
    
    return BottomAppBar(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(Icons.home, 'Beranda', isSelected: true),
            const Spacer(),
            FloatingActionButton(
              onPressed: () => menuController.toggleMenu(),
              backgroundColor: Colors.white,
              elevation: 2,
              child: const Icon(Icons.add, color: Colors.black),
            ),
            const Spacer(),
            _buildNavItem(Icons.person, 'Profil'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? AppTheme.primaryColor : Colors.grey,
          size: 24,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? AppTheme.primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }
}