import 'package:badminton/modules/orientation_module/orientation_coach_connekt/widget/available_coaches_gridview.dart';
import 'package:badminton/modules/orientation_module/orientation_coach_connekt/widget/custom_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';

class CoachConnekt extends StatefulWidget {
  const CoachConnekt({super.key});

  @override
  State<CoachConnekt> createState() => _CoachConnekState();
}

class _CoachConnekState extends State<CoachConnekt> {
  // Sample data for coaches
  final List<CoachData> coaches = [
    CoachData(
        name: 'Mulyo Handoyo',
        imageUrl: 'assets/images/profile_image/Ellipse 101.png',
        location: 'Kuala Lumpur'),
    CoachData(
        name: 'Mulyo Handoyo',
        imageUrl: 'assets/images/profile_image/Ellipse 102.png',
        location: 'Kuala Lumpur'),
    CoachData(
        name: 'Mulyo Handoyo',
        imageUrl: 'assets/images/profile_image/Ellipse 103.png',
        location: 'Kuala Lumpur'),
    CoachData(
        name: 'Mulyo Handoyo',
        imageUrl: 'assets/images/profile_image/Ellipse 104.png',
        location: 'Kuala Lumpur'),
    CoachData(
        name: 'Mulyo Handoyo',
        imageUrl: 'assets/images/profile_image/Ellipse 105.png',
        location: 'Kuala Lumpur'),
    CoachData(
        name: 'Mulyo Handoyo',
        imageUrl: 'assets/images/profile_image/Ellipse 106.png',
        location: 'Kuala Lumpur'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Stack(
          children: [
            Positioned.fill(
              top: -50,
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_images/LoopeBGreq.png'),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            Padding(
              padding: responsiveAllPadding(context, 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight(context, 0.025),
                  const ProfileCardWidgetDivider(
                    image:
                        'assets/images/profile_image/coach_player_home_profile_image.png',
                    name: 'Lee Chong Wei',
                    title: 'Beginner',
                    location: 'Kuala Lumpur',
                  ),
                  kHeight(context, 0.03),
                  CustomText(
                    text: 'Available Coaches',
                    textAlign: TextAlign.justify,
                    fontSize: getResponsiveFontSize(context, 16),
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),
                  kHeight(context, 0.03),
                  Expanded(
                    child: CoachGridView(
                      coaches: coaches,
                      onCoachTap: (coach) {
                        // Handle coach tap
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
