import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import '../../controllers/floating_action_menu_controller.dart';
import '../../../../themes/theme.dart';

class FloatingActionMenu extends StatelessWidget {
  const FloatingActionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FloatingActionMenuController>();
    
    return Obx(() {
      if (!controller.isMenuOpen.value) {
        return const SizedBox.shrink();
      }
      
      return Positioned.fill(
        child: Stack(
          children: [
            // Blurred background
            Positioned.fill(
              child: GestureDetector(
                onTap: () => controller.closeMenu(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            
            // Menu items - positioned at the bottom
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildMenuItem(
                      'Registrasi',
                      Icons.app_registration,
                      AppTheme.primaryColor,
                      onTap: () => controller.navigateToRegistration(),
                    ),
                    const SizedBox(height: 16),
                    _buildMenuItem(
                      'Pra Registrasi',
                      Icons.edit_document,
                      Colors.teal,
                      onTap: () => controller.navigateToRegistration(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
  
  Widget _buildMenuItem(String label, IconData icon, Color color, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: color,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}