import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CoachTeamContainerWidget extends StatelessWidget {
  final String iconImage;
  final String title;
  final double leftFactor;
  final double rightFactor;
  final double topFactor;
  final double bottomFactor;
  final Color textColor;
  const CoachTeamContainerWidget(
    this.leftFactor,
    this.rightFactor,
    this.bottomFactor,
    this.topFactor,
    this.textColor, {
    super.key,
    required this.iconImage,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: lightGrey),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: tileColor.withOpacity(0.25)),
      child: Padding(
        padding: responsiveSidePadding(context,
            topFactor: topFactor, leftFactor: leftFactor, rightFactor: rightFactor, bottomFactor: bottomFactor),
        child: Column(
          children: [
            Image.asset(iconImage),
            kHeight(context, 0.01),
            CustomText(
              text: title,
              color: textColor,
              fontSize: getResponsiveFontSize(context, 13),
            )
          ],
        ),
      ),
    );
  }
}
