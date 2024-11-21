import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String imagePath;
  final String label;
  final VoidCallback onPressed;

  const DashboardCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: const Color(0x39434F66),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height * 0.02,
            horizontal: size.width * 0.01,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * 0.06,
                child: Image.asset(
                  imagePath,
                  height:
                      size.height * 0.5, // Set icon size based on screen size
                  fit: BoxFit.contain,
                ),
              ),
              kWidth(context, 0.02),
              CustomText(
                text: label,
                textAlign: TextAlign.justify,
                fontSize: getResponsiveFontSize(context, 16),
                color: white,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
