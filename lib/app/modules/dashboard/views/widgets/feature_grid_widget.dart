import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/feature_section_controller.dart';

class FeatureGridWidget extends StatelessWidget {
  const FeatureGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final featureController = Get.find<FeatureSectionController>();
    
    return Obx(() {
      final features = featureController.currentFeatures;
      
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: features.length < 3 
              ? MainAxisAlignment.start 
              : MainAxisAlignment.spaceAround,
          children: [
            for (var feature in features)
              _buildFeatureItem(feature.icon, feature.label),
          ],
        ),
      );
    });
  }

  Widget _buildFeatureItem(IconData icon, String label) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.grey[700], size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}