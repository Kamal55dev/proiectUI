import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RakScreen extends ConsumerWidget {
  const RakScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: responsiveSidePadding(
            context,
            leftFactor: 0.04,
            rightFactor: 0.03,
            topFactor: 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Experience\nthe power of RAK!',
                fontSize: getResponsiveFontSize(context, 24),
                color: white,
                fontWeight: FontWeight.w600,
              ),
              kHeight(context, 0.035),
              Container(
                padding: EdgeInsets.symmetric(horizontal: kwidth * 0.01),
                height: kheight * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: boxColor,
                    border: Border.all(color: white, width: kwidth * 0.0015),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/coach_images/Group.png',
                      height: kheight * 0.1,
                      width: kwidth * 0.15,
                      fit: BoxFit.contain,
                    ),
                    CustomText(
                text: 'Super Smash Badminton Acdemy',
                fontSize: getResponsiveFontSize(context, 15),
                color:  const Color(0xFFFFF7D7),
                fontWeight: FontWeight.w400,
              ),
                  ],
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
