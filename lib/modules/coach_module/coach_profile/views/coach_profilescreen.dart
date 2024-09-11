import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_profile/controllers/coach_profile_controller.dart';
import 'package:badminton/modules/coach_module/coach_profile/views/coach_license.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoachProfile extends ConsumerWidget {
  const CoachProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;
    final profileController = ref.watch(coachprofilecontrollerProvider);
    List<String> heading = [
      'Less than a year',
      '1 to 2 years',
      '2 to 4 years',
      'More than 4 years'
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
                      text: 'How long you have been coaching?',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(3, (index) {
                            return buildSelectableItem(context, kwidth, kheight,
                                index, profileController, heading);
                          }),
                        ),
                        SizedBox(height: kheight * 0.02),
                        Row(
                          children: [
                            buildSelectableItem(context, kwidth, kheight, 3,
                                profileController, heading),
                          ],
                        ),
                        SizedBox(
                          height: kheight * 0.05,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: profileController.selectedIndex == -1
                                ? null
                                : () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CoachProfileLicense(),
                                        ));
                                  },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kwidth * 0.035),
                              margin: EdgeInsets.only(left: kwidth * 0.02),
                              height: kheight * 0.05,
                              width: kwidth * 0.23,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: profileController.selectedIndex == -1
                                      ? grey
                                      : primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                color: profileController.selectedIndex == -1
                                    ? Colors.transparent
                                    : primaryColor,
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Next',
                                    color: profileController.selectedIndex == -1
                                        ? grey
                                        : white,
                                    fontSize:
                                        getResponsiveFontSize(context, 14),
                                    fontWeight: FontWeight.w400,
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: kwidth * 0.02,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: profileController.selectedIndex == -1
                                        ? grey
                                        : white,
                                    size: kwidth * 0.05,
                                  )
                                ],
                              ),
                            ),
                          ),
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
        profileController.selectItem(index);
      },
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kwidth * 0.02),
          margin: EdgeInsets.only(left: kwidth * 0.02),
          height: kheight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: profileController.selectedIndex == index
                ? secondaryColor
                : Colors.transparent,
            border: Border.all(
              color: profileController.selectedIndex == index
                  ? secondaryColor
                  : secondaryColor,
              width: 2.0,
            ),
          ),
          alignment: Alignment.center,
          child: CustomText(
            text: heading[index],
            color: profileController.selectedIndex == index ? black : white,
            fontSize: getResponsiveFontSize(context, 14),
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
