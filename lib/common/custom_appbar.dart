import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final IconData leadingIcon;
  final String title;
  final String image;
  final Function()? onTap;
  const CustomAppbar(
    this.image, {
    super.key,
    required this.leadingIcon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onTap,
                child: Icon(
                  leadingIcon,
                  color: white,
                ),
              ),
              const VerticalDivider(
                color: lightGrey,
                thickness: 2,
                indent: 1,
                endIndent: 1,
              ),
              kWidth(context, 0.01),
              CustomText(
                text: title,
                color: white,
                fontSize: getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(image),
            ],
          ),
        ],
      ),
    );
  }
}
