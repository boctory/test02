import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test02/widgets/header.dart';
import 'package:test02/widgets/result_section.dart';

class ResultPageWeb1440 extends StatelessWidget {
  const ResultPageWeb1440({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
            ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                ? _buildDesktopLayout(context)
                : _buildMobileLayout(context),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Column(
      children: [
        const Header(),
        const SizedBox(height: 20),
        const ResultSection(),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(context, 'Download', () {
              // Download functionality
            }),
            const SizedBox(width: 50),
            _buildButton(context, 'Share', () {
              // Share functionality
            }),
            const SizedBox(width: 50),
            _buildButton(context, 'Try On', () {
              // Try On functionality
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        const Header(),
        const SizedBox(height: 10),
        const ResultSection(),
        const SizedBox(height: 20),
        Column(
          children: [
            _buildButton(context, 'Download', () {
              // Download functionality
            }),
            const SizedBox(height: 20),
            _buildButton(context, 'Share', () {
              // Share functionality
            }),
            const SizedBox(height: 20),
            _buildButton(context, 'Try On', () {
              // Try On functionality
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black.withOpacity(0.2), width: 1),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
