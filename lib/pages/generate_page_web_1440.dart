import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test02/widgets/header.dart';
import 'package:test02/widgets/generate_section.dart';
import 'package:test02/widgets/select_section.dart';

class GeneratePageWeb1440 extends StatelessWidget {
  const GeneratePageWeb1440({Key? key}) : super(key: key);

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
        const GenerateSection(),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SelectSection(
            onImageClick: (index) {
              // Handle image click
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        const Header(),
        const SizedBox(height: 10),
        const GenerateSection(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SelectSection(
            onImageClick: (index) {
              // Handle image click
            },
          ),
        ),
      ],
    );
  }
}
