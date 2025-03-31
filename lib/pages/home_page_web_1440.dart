import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:test02/widgets/header.dart';
import 'package:test02/widgets/home_section.dart';
import 'package:test02/widgets/best_section.dart';
import 'package:test02/widgets/tutorial_section.dart';

class HomePageWeb1440 extends StatelessWidget {
  const HomePageWeb1440({Key? key}) : super(key: key);

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
        const HomeSection(),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: BestSection(
            title: "Best Hanbok Collections",
            onImageClick: (index) {
              // Handle image click later with counter
            },
          ),
        ),
        const SizedBox(height: 40),
        const TutorialSection(),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        const Header(),
        const SizedBox(height: 10),
        const HomeSection(),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BestSection(
            title: "Best Hanbok Collections",
            onImageClick: (index) {
              // Handle image click later with counter
            },
          ),
        ),
        const SizedBox(height: 20),
        const TutorialSection(),
      ],
    );
  }
}
