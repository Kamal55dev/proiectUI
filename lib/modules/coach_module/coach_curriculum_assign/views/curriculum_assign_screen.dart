import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_profile_card_widget.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CurriculumAssignScreen extends StatelessWidget {
  const CurriculumAssignScreen({super.key});

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
              text: "Assign Curriculum",
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
            ),
          ),
        ],
      ),
      body: Padding(
        padding: responsiveAllPadding(context, 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                  kHeight(context, 0.03),
                  const ProfileCardWidget(
                    image: 'assets/images/user_images/male_user.png',
                    name: 'Name',
                    title: 'Advance',
                    location: "location",
                  ),
                  Positioned(
                    top: 120,
                    child: CustomText(
                      text: 'Basic Technique',
                      color: white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
