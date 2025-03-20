import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Form controllers
  final idCardController = TextEditingController();
  final accessCardController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  
  // Reactive variables
  final RxBool isLoading = false.obs;
  final RxBool isFormValid = false.obs;
  final RxBool isEmailValid = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    
    // Add listeners to validate form as user types
    nameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
  }
  
  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    idCardController.dispose();
    accessCardController.dispose();
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
  
  void _validateForm() {
    // Check if required fields are filled
    final nameValid = nameController.text.trim().isNotEmpty;
    
    // Email validation - check if it's not empty and has valid format
    final email = emailController.text.trim();
    final emailValid = email.isNotEmpty && GetUtils.isEmail(email);
    
    isEmailValid.value = email.isEmpty || emailValid;
    isFormValid.value = nameValid && emailValid;
  }
  
  void continueRegistration() {
    if (isFormValid.value) {
      isLoading.value = true;
      
      // Simulate API call
      Future.delayed(const Duration(seconds: 1), () {
        isLoading.value = false;
        // Navigate to next screen or complete registration
        Get.snackbar(
          'Sukses', 
          'Langkah pertama registrasi berhasil',
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    }
  }
  
  void cancel() {
    Get.back();
  }
}