import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_profile/controllers/coach_profile_controller.dart';
import 'package:badminton/modules/coach_module/coach_profile/views/coach_rakverification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachProfileOpenforCoach extends ConsumerWidget {
  const CoachProfileOpenforCoach({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;
    final profileController = ref.watch(coachprofilecontrollerProvider);
    List<String> heading = [
      'Yes, I can Coach',
      'No, Not at the moment',
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: CustomText(
          text: 'Coaching Profile',
          color: white,
          fontSize: getResponsiveFontSize(context, 18),
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            icon: Icon(
              Icons.clear_rounded,
              color: white,
              size: kwidth * 0.07,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: kheight * 0.02,
          ),
          Stack(
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  heightFactor: 0.6,
                  widthFactor: 0.9,
                  child: SizedBox(
                    height: kheight * 0.2,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/bg_images/Looper BG.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: kwidth * 0.02, vertical: kheight * 0.045),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Are you open for coaching?',
                      color: white,
                      fontSize: getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: kheight * 0.02,
                    ),
                    Column(
                      children: [
                        Row(
                          children: List.generate(2, (index) {
                            return buildSelectableItem(context, kwidth, kheight,
                                index, profileController, heading);
                          }),
                        ),
                        SizedBox(
                          height: kheight * 0.05,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: secondaryColor,
                                size: kwidth * 0.06,
                              ),
                            ),
                            SizedBox(width: kwidth * 0.02),
                            CustomText(
                              text: 'Previous',
                              color: secondaryColor,
                              fontSize: getResponsiveFontSize(context, 14),
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(width: kwidth * 0.48),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: profileController.coachopening == -1
                                    ? null // Disable tap when no selection is made
                                    : () {
                                        Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CoachProfileRakVerification(),
                                    ),
                                  );
                                      },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: kwidth * 0.035),
                                  margin: EdgeInsets.only(left: kwidth * 0.02),
                                  height: kheight * 0.05,
                                  width: kwidth * 0.23,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: profileController.coachopening ==
                                              -1
                                          ? grey
                                          : primaryColor, // Change border color based on selection
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: profileController.coachopening == -1
                                        ? Colors
                                            .transparent // Disabled state with transparent background
                                        : primaryColor, // Enabled state with primary color
                                  ),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Finish',
                                      color: profileController.coachopening ==
                                              -1
                                          ? grey // Text color when disabled
                                          : white, // Text color when enabled
                                      fontSize:
                                          getResponsiveFontSize(context, 14),
                                      fontWeight: FontWeight.w400,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSelectableItem(
    BuildContext context,
    double kwidth,
    double kheight,
    int index,
    var profileController,
    List<String> heading,
  ) {
    return GestureDetector(
      onTap: () {
        profileController.selectcoachopening(index); // Correct function call
      },
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kwidth * 0.02),
          margin: EdgeInsets.only(left: kwidth * 0.025),
          height: kheight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: profileController.coachopening == index
                ? secondaryColor
                : Colors.transparent,
            border: Border.all(
              color: secondaryColor,
              width: 2.0,
            ),
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: heading[index],
            color: profileController.coachopening == index ? black : white,
            fontSize: getResponsiveFontSize(context, 14),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
