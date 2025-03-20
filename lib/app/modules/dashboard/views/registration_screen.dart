import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/registration_controller.dart';
import '../../../themes/theme.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulir Registrasi'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildStepIndicator(),
              const SizedBox(height: 24),
              _buildFormTitle(),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIdCardField(controller),
                        const SizedBox(height: 16),
                        _buildAccessCardField(controller),
                        const SizedBox(height: 16),
                        _buildNameField(controller),
                        const SizedBox(height: 16),
                        _buildEmailField(controller),
                      ],
                    ),
                  ),
                ),
              ),
              _buildButtons(controller),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildStepIndicator() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '1',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
  
  Widget _buildFormTitle() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: const Text(
        'Data Pribadi',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
  
  Widget _buildIdCardField(RegistrationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              const TextSpan(text: 'Nomor Kartu Identitas '),
              TextSpan(
                text: '(tidak wajib diisi)',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.idCardController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            prefixIcon: const Icon(Icons.credit_card),
            prefixIconColor: Colors.grey[600],
            hintText: 'Masukkan Nomor Kartu Identitas'
          ),
        ),
      ],
    );
  }
  
  Widget _buildAccessCardField(RegistrationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              const TextSpan(text: 'Nomor Kartu Akses '),
              TextSpan(
                text: '(tidak wajib diisi)',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.accessCardController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            prefixIcon: const Icon(Icons.credit_card),
            prefixIconColor: Colors.grey[600],
            hintText: 'Masukkan Nomor Kartu Akses',
          ),
        ),
      ],
    );
  }
  
  Widget _buildNameField(RegistrationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              TextSpan(text: 'Nama'),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.nameController,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            prefixIcon: const Icon(Icons.person),
            prefixIconColor: Colors.grey[600],
            hintText: 'Nama'
          ),
        ),
      ],
    );
  }
  
  Widget _buildEmailField(RegistrationController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black87, fontSize: 14),
            children: [
              TextSpan(text: 'Email'),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => TextField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            errorText: controller.isEmailValid.value 
                ? null 
                : 'Format email tidak valid',
            hintText: 'Email',
            prefixIcon: const Icon(Icons.email),
            prefixIconColor: Colors.grey[600],
          ),
        )),
      ],
    );
  }
  
  Widget _buildButtons(RegistrationController controller) {
    return Column(
      children: [
        Obx(() => Container(
          width: double.infinity,
          height: 50,
          margin: const EdgeInsets.only(bottom: 16),
          child: ElevatedButton(
            onPressed: controller.isFormValid.value && !controller.isLoading.value
                ? () => controller.continueRegistration()
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              disabledBackgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              disabledForegroundColor: Colors.grey,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: controller.isLoading.value
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.black54,
                      strokeWidth: 3,
                    ),
                  )
                : const Text(
                    'Selanjutnya',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
          ),
        )),
        Container(
          width: double.infinity,
          height: 50,
          child: OutlinedButton(
            onPressed: () => controller.cancel(),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
              side: BorderSide(color: AppTheme.primaryColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Batal',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}