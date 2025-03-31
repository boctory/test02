import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      width: double.infinity,
      height: isMobile ? 400 : 900,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_section_bg.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 40 : 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: isMobile ? 350 : 634),
              child: Column(
                children: [
                  // First text
                  Text(
                    'We create your own special moments.',
                    style: TextStyle(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      shadows: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 20),

                  // Second text
                  Text(
                    'Experience the beauty of Hanbok.',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      shadows: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 27),

                  // Try On Button
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
                          fontSize: 20,
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
      ),
    );
  }
}
