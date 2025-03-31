import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class GenerateSection extends StatelessWidget {
  const GenerateSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      width: double.infinity,
      height: isMobile ? 700 : 1024,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upload button
                _buildUploadButton(context),

                const SizedBox(width: 34),

                // Right side - Image display and preset buttons
                Expanded(
                  child: Column(
                    children: [
                      // Image display area
                      Container(
                        height: 700,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE1E1E1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFF0C0C0C).withOpacity(0.2),
                            width: 0.2,
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 60,
                                  color: Color(0xFF6E6E6E),
                                  height: 0.8,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'select your hanbok',
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Color(0xFF6E6E6E),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Preset buttons
                      SizedBox(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildPresetButton(
                              context,
                              'assets/images/image_button01.png',
                            ),
                            const SizedBox(width: 20),
                            _buildPresetButton(
                              context,
                              'assets/images/image_button02.png',
                            ),
                            const SizedBox(width: 20),
                            _buildPresetButton(
                              context,
                              'assets/images/image_button03.png',
                            ),
                            const SizedBox(width: 20),
                            _buildPresetButton(
                              context,
                              'assets/images/image_button04.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Try On button
          InkWell(
            onTap: () {
              // Navigate to result page
              Navigator.pushNamed(context, '/result');
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.black.withOpacity(0.1),
                  width: 0.2,
                ),
              ),
              child: const Text(
                'Try On',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFAAAAAA),
              width: 2,
              style:
                  BorderStyle
                      .solid, // Using solid since dashed is not directly available
            ),
          ),
          child: const Center(
            child: Text(
              '+',
              style: TextStyle(
                fontSize: 60,
                color: Color(0xFFAAAAAA),
                height: 0.8,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'your image',
          style: TextStyle(fontSize: 20, color: Color(0xFF6E6E6E)),
        ),
      ],
    );
  }

  Widget _buildPresetButton(BuildContext context, String imagePath) {
    return InkWell(
      onTap: () {
        // Select this preset image
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.2),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
