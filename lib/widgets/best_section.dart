import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class BestSection extends StatefulWidget {
  final String? title;
  final Function(int) onImageClick;

  const BestSection({Key? key, this.title, required this.onImageClick})
    : super(key: key);

  @override
  State<BestSection> createState() => _BestSectionState();
}

class _BestSectionState extends State<BestSection> {
  final List<String> imageList = [
    'assets/images/image_button01.png',
    'assets/images/image_button02.png',
    'assets/images/image_button03.png',
    'assets/images/image_button04.png',
    'assets/images/image_button05.png',
    'assets/images/image_button06.png',
    'assets/images/image_button07.png',
    'assets/images/image_button08.png',
  ];

  final List<int> clickCounts = List.filled(8, 0);
  bool showMoreImages = false;

  List<int> _getSortedIndices() {
    if (widget.title == null) {
      return List.generate(clickCounts.length, (index) => index);
    }

    // Create a list of indices and sort them based on click counts
    List<int> indices = List.generate(clickCounts.length, (index) => index);
    indices.sort((a, b) => clickCounts[b].compareTo(clickCounts[a]));
    return indices;
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).smallerThan(TABLET);
    List<int> sortedIndices = _getSortedIndices();

    return Column(
      children: [
        if (widget.title != null) ...[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              widget.title!,
              style: TextStyle(
                fontSize: isMobile ? 24 : 30,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],

        // Bento-style grid
        MasonryGridView.count(
          crossAxisCount: isMobile ? 1 : 4,
          mainAxisSpacing: 40,
          crossAxisSpacing: 40,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: showMoreImages ? imageList.length : (isMobile ? 4 : 8),
          itemBuilder: (context, index) {
            final imageIndex = sortedIndices[index % sortedIndices.length];
            final bool isSmallImage =
                imageIndex % 3 == 1; // Every third image is smaller

            return GestureDetector(
              onTap: () {
                // Increment click count
                setState(() {
                  clickCounts[imageIndex]++;
                });
                widget.onImageClick(imageIndex);
              },
              child: Container(
                height:
                    isSmallImage
                        ? (isMobile
                            ? 250
                            : 300) // Smaller height for some images
                        : (isMobile
                            ? 350
                            : 450), // Normal height for most images
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black.withOpacity(0.1),
                    width: 0.2,
                  ),
                  boxShadow:
                      index == 0
                          ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4),
                            ),
                          ]
                          : null,
                  image: DecorationImage(
                    image: AssetImage(imageList[imageIndex % imageList.length]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),

        // "More Images" button
        if (!showMoreImages) ...[
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              setState(() {
                showMoreImages = true;
              });
            },
            child: const Text(
              "More Images",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
