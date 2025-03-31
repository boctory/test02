import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResultSection extends StatelessWidget {
  const ResultSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);

    return Container(
      width: double.infinity,
      height: isMobile ? 700 : 900,
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F3F3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.1), width: 0.2),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE1E1E1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black.withOpacity(0.1),
              width: 0.2,
            ),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Placeholder for the result image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    width: isMobile ? 300 : 800,
                    height: isMobile ? 500 : 800,
                    child: const Center(
                      child: Text(
                        'Result Image',
                        style: TextStyle(fontSize: 24, color: Colors.black54),
                      ),
                    ),
                  ),
                ),

                // Loading indicator (when processing)
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 200,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
