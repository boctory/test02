import 'package:flutter/material.dart';
import 'package:test02/widgets/best_section.dart';

class SelectSection extends StatefulWidget {
  final Function(int) onImageClick;

  const SelectSection({Key? key, required this.onImageClick}) : super(key: key);

  @override
  State<SelectSection> createState() => _SelectSectionState();
}

class _SelectSectionState extends State<SelectSection> {
  String? activeFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter buttons
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildFilterButton('Modern'),
              const SizedBox(width: 40),
              _buildFilterButton('Tradition'),
            ],
          ),
        ),

        // Reuse BestSection for the gallery
        BestSection(onImageClick: widget.onImageClick),
      ],
    );
  }

  Widget _buildFilterButton(String filterName) {
    final bool isActive = activeFilter == filterName;

    return InkWell(
      onTap: () {
        setState(() {
          activeFilter = isActive ? null : filterName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: isActive ? Colors.black : const Color(0xFFAAAAAA),
            width: 1.2,
          ),
        ),
        child: Text(
          filterName,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? Colors.black : const Color(0xFF6E6E6E),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
