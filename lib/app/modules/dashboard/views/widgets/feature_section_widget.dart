import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/feature_section_controller.dart';
import '../../../../themes/theme.dart';

class FeatureSectionWidget extends StatelessWidget {
  const FeatureSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final controller = Get.put(FeatureSectionController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fitur',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40, // Fixed height for the tabs
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.featureTabs.length,
              itemBuilder: (context, index) {
                // Using Obx directly around the widget that needs to be updated
                return Obx(() {
                  final isSelected = controller.selectedTabIndex.value == index;
                  return GestureDetector(
                    onTap: () => controller.changeTab(index),
                    child: _buildFeatureTab(
                      controller.featureTabs[index], 
                      isSelected: isSelected,
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTab(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.secondaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? AppTheme.primaryColor : Colors.black87,
          fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
        ),
      ),
    );
  }
}