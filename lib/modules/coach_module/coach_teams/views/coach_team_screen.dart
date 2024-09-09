import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/custom_appbar.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_overview/views/coach_overview_screen.dart';
import 'package:badminton/modules/coach_module/coach_teams/widgets/stack_profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachTeamScreen extends ConsumerWidget {
  const CoachTeamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    List<Map<String, dynamic>> teamsData = [
      {
        'teamName': 'Team Blue',
        'playersCount': '20 Players',
        'playerNames': ['Alice', 'Bob', 'Charlie'],
        'playerColors': [Colors.red, Colors.green, Colors.blue],
        'todayCount': '12',
      },
      {
        'teamName': 'Team Red',
        'playersCount': '18 Players',
        'playerNames': ['David', 'Eva', 'Frank'],
        'playerColors': [Colors.orange, Colors.purple, Colors.yellow],
        'todayCount': '10',
      },
    ];
    return SafeArea(
        child: Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: responsiveAllPadding(context, 0.03),
              child: Column(children: [
                CustomAppbar(
                  "assets/images/icon_images/Action Icons.png",
                  onTap: () {},
                  leadingIcon: Icons.arrow_back_rounded,
                  title: "Teams",
                ),
                Stack(
                  children: [
                    Positioned(
                      right: 16,
                      bottom: 0,
                      child: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.3,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: size.height * 0.14,
                                width: size.width * 0.55,
                                child: CustomText(
                                  text: 'Super Smash Badminton Aca...',
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
                                  height: size.height * 0.25,
                                  width: size.width * 0.3,
                                ),
                              ))
                            ]),
                      ]),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 15,
                      child: CustomText(
                        text: 'My Teams',
                        color: white,
                        fontSize: getResponsiveFontSize(context, 13),
                      ),
                    )
                  ],
                ),
                kHeight(context, 0.01),
                Padding(
                  padding: responsiveSidePadding(context, leftFactor: 0.02, rightFactor: 0.02),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: teamsData.length,
                    itemBuilder: (context, index) {
                      final team = teamsData[index];
                      return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CoachOverviewScreen(),
                            ));
                          },
                          child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              height: size.height * 0.15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: lightGrey),
                                borderRadius: const BorderRadius.all(Radius.circular(14)),
                                color: tileColor.withOpacity(0.25),
                              ),
                              child: Padding(
                                  padding: responsiveAllPadding(context, 0.03),
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 7,
                                          backgroundColor: goldenColor,
                                        ),
                                        kWidth(context, 0.02),
                                        CustomText(
                                          text: team['teamName'],
                                          color: white,
                                        ),
                                      ],
                                    ),
                                    kHeight(context, 0.02),
                                    Row(
                                      children: [
                                        StackProfileWidget(
                                          names: List<String>.from(team['playerNames']),
                                          colors: List<Color>.from(team['playerColors']),
                                        ),
                                        kWidth(context, 0.02),
                                        CustomText(
                                          text: team['playersCount'],
                                          color: grey,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      color: lightGrey,
                                      thickness: 0.5,
                                    ),
                                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                      Icon(
                                        Icons.calendar_today_rounded,
                                        color: const Color(0xFF3DD598),
                                        size: getResponsiveFontSize(context, 18),
                                      ),
                                      kWidth(context, 0.01),
                                      const CustomText(
                                        text: "Today : ",
                                        color: grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      CustomText(
                                        text: team['todayCount'],
                                        color: white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ])
                                  ]))));
                    },
                  ),
                )
              ]))
        ]),
      ),
    ));
  }
}
