import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class TutorialSection extends StatelessWidget {
  const TutorialSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'How To Use Try On',
              style: TextStyle(
                fontSize: isMobile ? 24 : 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Tutorial steps - wrapping in row for responsive layout
          Wrap(
            spacing: 10,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildTutorialStep(
                context,
                'Step 1 select \'hanbok\' image',
                'Choose your favorite \'Hanbok\' image. You can also filter to view only the desired types of Hanbok',
                'assets/images/tutorial_image1.png',
              ),
              _buildUploadStep(context),
              _buildTutorialStep(
                context,
                'Step 3 Start the Try On!',
                'Click \'Try On!\' to experience Hanbok, \nand you can download the results anytime.',
                'assets/images/tutorial_image3.png',
              ),
            ],
          ),

          // Footer call to action
          Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(vertical: 40),
            width: 1312,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Try On \'Hanbok\' now!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: isMobile ? 24 : 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Experience the beauty of \'Hanbok\'',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: isMobile ? 14 : 18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFAAAAAA),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    // Navigate to generate page
                    Navigator.pushNamed(context, '/generate');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black.withOpacity(0.1),
                        width: 0.2,
                      ),
                    ),
                    child: const Text(
                      'Try On Start',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTutorialStep(
    BuildContext context,
    String title,
    String description,
    String imagePath,
  ) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    double containerWidth = isMobile ? 300 : 411;

    return Container(
      width: containerWidth,
      height: 465,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Title
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          // Description
          Text(
            description,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFFAAAAAA),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUploadStep(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    double containerWidth = isMobile ? 300 : 411;

    return Container(
      width: containerWidth,
      height: 465,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Step 2 UI
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background elements
                Container(
                  color: Colors.white,
                  margin: const EdgeInsets.all(20),
                ),

                // Upload circle
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFAAAAAA),
                          width: 2,
                          style: BorderStyle.none,
                        ),
                      ),
                      child: CustomPaint(
                        painter: DashedCircleBorderPainter(
                          color: const Color(0xFFAAAAAA),
                          strokeWidth: 2.0,
                          dashWidth: 4.0,
                          dashSpace: 4.0,
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
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'your image',
                      style: TextStyle(fontSize: 20, color: Color(0xFF6E6E6E)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Title
          const Text(
            'Step 2 Upload your faces',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          // Description
          const Text(
            'Upload your face image, and you can change it to a different photo anytime.',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xFFAAAAAA),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedCircleBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  DashedCircleBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    double dashCount = (2 * radius * 3.14159) / (dashWidth + dashSpace);
    double angle = (dashWidth + dashSpace) / radius;
    double startAngle = 0;

    for (int i = 0; i < dashCount.floor(); i++) {
      canvas.drawArc(
        Rect.fromCircle(
          center: Offset(radius, radius),
          radius: radius - (strokeWidth / 2),
        ),
        startAngle,
        dashWidth / radius,
        false,
        paint,
      );
      startAngle += angle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
