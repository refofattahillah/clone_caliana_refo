import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Image.asset('assets/images/logo.png', height: 32, width: 32),
          const SizedBox(width: 8),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Color(0xFF00BCD4),
            radius: 16,
            child: Icon(Icons.person, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 16),
          const Icon(Icons.notifications_outlined, size: 24),
        ],
      ),
    );
  }
}