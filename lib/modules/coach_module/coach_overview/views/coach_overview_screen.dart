import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_attendance/views/coach_attendance_screen.dart';
import 'package:badminton/modules/coach_module/coach_overview/widgets/coach_container_widget.dart';
import 'package:badminton/modules/coach_module/coach_wellness/views/coach_wellness_screen.dart';
import 'package:flutter/material.dart';

class CoachOverviewScreen extends StatelessWidget {
  const CoachOverviewScreen({super.key});

  final List<Map<String, String>> players = const [
    {"name": "Player 1", "level": "Beginner", "image": "assets/images/icon_images/Group.png"},
    {"name": "Player 2", "level": "Intermediate", "image": "assets/images/icon_images/Group.png"},
    {"name": "Player 3", "level": "Advanced", "image": "assets/images/icon_images/Group.png"},
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Row(
          children: [
            kWidth(context, 0.02),
            CustomText(
              text: "Boys Under 14",
              color: white,
              fontSize: getResponsiveFontSize(context, 18),
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: grey,
              )),
        ],
      ),
      body: Stack(
        children: [
          ClipRect(
            child: Align(
              alignment: Alignment.topLeft,
              heightFactor: 0.9,
              widthFactor: 0.9,
              child: SizedBox(
                height: size.height * 0.35,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/bg_images/Looper BG.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: responsiveAllPadding(context, 0.05),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CoachTeamContainerWidget(
                        0.05,
                        0.05,
                        iconImage: 'assets/images/icon_images/Group.png',
                        title: 'Overview',
                        0.05,
                        0.05,
                        primaryColor,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CoachAttendanceScreen(),
                          ));
                        },
                        child: const CoachTeamContainerWidget(
                            0.03,
                            0.03,
                            iconImage: 'assets/images/icon_images/attendance icon.png',
                            title: 'Attendance',
                            0.05,
                            0.03,
                            white),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CoachWellnessScreen(),
                          ));
                        },
                        child: const CoachTeamContainerWidget(
                            0.05,
                            0.05,
                            iconImage: 'assets/images/icon_images/wellness icon.png',
                            title: 'Wellness',
                            0.05,
                            0.03,
                            white),
                      ),
                    ],
                  ),
                  kHeight(context, 0.03),
                  CustomText(
                    text: 'Players',
                    color: white,
                    fontSize: getResponsiveFontSize(context, 14),
                  ),
                  kHeight(context, 0.02),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: players.length,
                    itemBuilder: (context, index) {
                      final player = players[index];
                      return Padding(
                        padding: responsiveSidePadding(context, bottomFactor: 0.04),
                        child: IntrinsicHeight(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGrey),
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              color: tileColor.withOpacity(0.25),
                            ),
                            child: Padding(
                              padding: responsiveAllPadding(context, 0.04),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundImage: AssetImage(player['image']!),
                                      ),
                                      kWidth(context, 0.02),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: player['name']!,
                                            color: white,
                                            fontSize: getResponsiveFontSize(context, 12),
                                          ),
                                          Container(
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                                color: beginnerColor),
                                            child: Padding(
                                              padding: responsiveSidePadding(context,
                                                  bottomFactor: 0.004,
                                                  topFactor: 0.004,
                                                  leftFactor: 0.01,
                                                  rightFactor: 0.01),
                                              child: CustomText(
                                                text: player['level']!,
                                                color: primaryColor,
                                                fontSize: getResponsiveFontSize(context, 10),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.arrow_circle_right_outlined,
                                      color: Colors.white60,
                                      size: getResponsiveFontSize(context, 26),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
