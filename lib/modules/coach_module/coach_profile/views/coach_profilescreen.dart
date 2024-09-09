import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_profile/controllers/coach_profile_controller.dart';
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    horizontal: kwidth * 0.04, vertical: kheight * 0.045),
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
                    SizedBox(
                      height: kheight * 0.05,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(left: kwidth * 0.02),
                              height: kheight * 0.03,
                              width: kwidth * 0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: primaryColor,
                                  border: Border.all(color: grey)),
                              child: CustomText(
                                text: 'How long',
                                color: white,
                                fontSize: getResponsiveFontSize(context, 16),
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}
