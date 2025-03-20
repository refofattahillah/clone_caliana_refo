import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeatureSectionController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  
  final List<String> featureTabs = [
    'Semua Fitur',
    'Visitor Management System',
    'Access Control System',
  ];
  
  // Maps to hold available features for each tab
  final Map<int, List<FeatureItem>> featuresByTab = {
    0: [ // Semua Fitur - shows all features
      FeatureItem(Icons.bar_chart, 'Dasbor'),
      FeatureItem(Icons.people, 'Daftar Pengunjung'),
      FeatureItem(Icons.home, 'Residen'),
    ],
    1: [ // Visitor Management System
      FeatureItem(Icons.bar_chart, 'Dasbor'),
      FeatureItem(Icons.people, 'Daftar Pengunjung'),
      FeatureItem(Icons.home, 'Residen'),
    ],
    2: [ // Access Control System
      FeatureItem(Icons.bar_chart, 'Dasbor'),
    ],
  };
  
  List<FeatureItem> get currentFeatures => 
    featuresByTab[selectedTabIndex.value] ?? featuresByTab[0]!;
  
  void changeTab(int index) {
    selectedTabIndex.value = index;
  }
}

class FeatureItem {
  final IconData icon;
  final String label;
  
  FeatureItem(this.icon, this.label);
}