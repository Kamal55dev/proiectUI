import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_profile_card_widget.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/custom_appbar.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_curriculum_assign/views/curriculum_assign_screen.dart';
import 'package:flutter/material.dart';

class CoachCurriculumScreen extends StatelessWidget {
  const CoachCurriculumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: Padding(
        padding: responsiveAllPadding(context, 0.03),
        child: Column(
          children: [
            CustomAppbar(
              "assets/images/icon_images/Action Icons.png",
              onTap: () {},
              leadingIcon: Icons.arrow_back_rounded,
              title: "Curriculum",
            ),
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor: 0.9,
                    widthFactor: 0.9,
                    child: SizedBox(
                      height: size.height * 0.4,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/bg_images/Looper BG.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 0,
                  child: Container(
                    height: size.height * 0.3,
                    width: size.width * 0.35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/coach_images/Ellipse 63.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: responsiveAllPadding(context, 0.03),
                  child: Column(children: [
                    kHeight(context, 0.03),
                    const ProfileCardWidget(
                      image: 'assets/images/user_images/male_user.png',
                      name: 'Name',
                      title: 'Advance',
                      location: "location",
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: size.height * 0.12,
                            width: size.width * 0.55,
                            child: CustomText(
                              text: 'Player\nCurriculum',
                              color: white,
                              fontSize: getResponsiveFontSize(context, 20),
                              fontWeight: FontWeight.bold,
                              maxline: 2,
                            ),
                          ),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              'assets/images/coach_images/star-dynamic-premium.png',
                              height: size.height * 0.23,
                              width: size.width * 0.32,
                            ),
                          ))
                        ]),
                    const Divider(
                      color: grey,
                      thickness: 1,
                    ),
                  ]),
                ),
              ],
            ),
            Padding(
              padding: responsivePadding(context, verticalFactor: 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'This Month',
                    color: white,
                    fontSize: getResponsiveFontSize(context, 13),
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: 'Assign New',
                    color: primaryColor,
                    fontSize: getResponsiveFontSize(context, 13),
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF292B2F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '24',
                            color: white,
                            fontWeight: FontWeight.w900,
                            fontSize: getResponsiveFontSize(context, 19),
                          ),
                          CustomText(
                            text: 'Sep 2024',
                            color: Colors.white70,
                            fontSize: getResponsiveFontSize(context, 12),
                          ),
                        ],
                      ),
                      kWidth(context, 0.02),
                      SizedBox(
                        height: size.height * 0.06,
                        width: size.width * 0.01,
                        child: const VerticalDivider(
                          color: grey,
                          thickness: 2,
                          indent: 2,
                          endIndent: 2,
                        ),
                      ),
                      kWidth(context, 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: 'Basic Technical Skills',
                            color: white,
                          ),
                          kHeight(context, 0.01),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: getResponsiveFontSize(context, 12),
                                child: const CustomText(
                                  text: 'A',
                                  color: black,
                                ),
                              ),
                              kWidth(context, 0.02),
                              const Text(
                                "player name",
                                style: TextStyle(color: Colors.white54, fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CurriculumAssignScreen(),
                      ));
                    },
                    child: Container(
                      width: size.width * 0.055,
                      height: size.height * 0.028,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: grey,
                          width: size.width * 0.002,
                        ),
                      ),
                      child: Icon(Icons.arrow_forward, color: white, size: getResponsiveFontSize(context, 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
