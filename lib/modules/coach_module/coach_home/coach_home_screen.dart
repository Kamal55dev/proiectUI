import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_home/widgets/home_menus.dart';
import 'package:badminton/modules/coach_module/coach_rak/rak_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachHomeScreen extends ConsumerWidget {
  const CoachHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: responsiveSidePadding(
              context,
              leftFactor: 0.03,
              rightFactor: 0.03,
              topFactor: 0.08,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/coach_images/Avatar.png'),
                ),
                kWidth(context, 0.02),
                CustomText(
                  text: 'Lee Ching Wei',
                  fontSize: getResponsiveFontSize(context, 16),
                  color: white,
                  fontWeight: FontWeight.w600,
                ),
                kWidth(context, 0.43),
                Container(
                  height: kheight * 0.02,
                  width: kwidth * 0.001,
                  color: white,
                ),
                kWidth(context, 0.01),
                Icon(
                  Icons.notifications_none,
                  color: white,
                  size: kwidth * 0.06,
                )
              ],
            ),
          ),
          Container(
            // height: kheight * 0.36,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/coach_images/Looper BG1.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: responsiveSidePadding(
                    context,
                    leftFactor: 0.64,
                    rightFactor: 0.01,
                    topFactor: 0.08,
                  ),
                  child: Image.asset(
                      'assets/images/coach_images/Group 1171277302.png'),
                ),
                const RakScreen(),
              ],
            ),
          ),
          kHeight(context, 0.025),
          const HomeMenu()
        ],
      ),
    );
  }
}
