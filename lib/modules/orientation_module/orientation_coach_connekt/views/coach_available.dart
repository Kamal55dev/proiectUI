import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_profile_card_widget.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/orientation_module/orientation_coach_connekt/widget/custom_profile_card.dart';
import 'package:flutter/material.dart';

class CoachConnektAvailable extends StatefulWidget {
  const CoachConnektAvailable({super.key});

  @override
  State<CoachConnektAvailable> createState() => _CoachConnektAvailableState();
}

class _CoachConnektAvailableState extends State<CoachConnektAvailable> {
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
                  // Custom AppBar using a Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Coach Connekt',
                        textAlign: TextAlign.justify,
                        fontSize: getResponsiveFontSize(context, 18),
                        color: white,
                        fontWeight: FontWeight.w600,
                      ),
                      IconButton(
                        icon:
                            Image.asset('assets/images/icon_images/Vector.png'),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  kHeight(context, 0.025),

                  // ProfileCardWidget
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
                    textAlign: TextAlign.left,
                    fontSize: getResponsiveFontSize(context, 18),
                    color: white,
                    fontWeight: FontWeight.w600,
                  ),

                  kHeight(context, 0.03),
                  Center(
                    child: Container(
                      height: size.height * 0.3,
                      width: size.width * 0.6,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/bg_images/house_search.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  kHeight(context, 0.03),
                  SizedBox(
                    width: double
                        .infinity, // Ensures the text container takes up all available width
                    child: CustomText(
                      text: 'No Coaches available in this location right now',
                      textAlign: TextAlign
                          .start, // Aligns text to the start of the container
                      fontSize: getResponsiveFontSize(context, 13),
                      color: white,
                      fontWeight: FontWeight.w500,
                      maxline: 1, // Ensures the text stays on a single line
                    ),
                  ),
                  kHeight(context, 0.03),
                  Center(
                    child: Container(
                      padding: responsiveAllPadding(context, 0.03),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: CustomText(
                        text: 'Move to waiting list',
                        textAlign: TextAlign.start,
                        fontSize: getResponsiveFontSize(context, 13),
                        color: white,
                        fontWeight: FontWeight.w500,
                        maxline: 1,
                      ),
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
