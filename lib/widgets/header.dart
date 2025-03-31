import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo
          Image.asset('assets/images/logo.png', height: 40),

          // User profile circle
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF6E6E6E),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
    );
  }
}
