import 'package:clone_caliana_refo/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FloatingActionMenuController extends GetxController {
  final RxBool isMenuOpen = false.obs;
  
  void toggleMenu() {
    isMenuOpen.value = !isMenuOpen.value;
  }
  
  void closeMenu() {
    isMenuOpen.value = false;
  }
  
  void navigateToRegistration() {
    closeMenu();
    // Navigate to registration page
    Get.toNamed(Routes.REGISTRATION);
  }
  
  void navigateToPraRegistration() {
    closeMenu();
    // Navigate to pre-registration page
    Get.snackbar(
      'Info', 
      'Pra Registrasi belum diimplementasikan',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}