import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class OreRaqSuccessScreen extends StatelessWidget {
  final String image;
  final String textOne;
  final String textTwo;

  const OreRaqSuccessScreen(
      {super.key,
      required this.image,
      required this.textOne,
      required this.textTwo});
  @override
  Widget build(BuildContext context) {
    // Getting the size of the screen
    final size = MediaQuery.of(context).size;
    // final kHeight = MediaQuery.of(context).size.height;
    // final kWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF202326), // background color
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background image
          Positioned(
            top: size.height * 0.01, // Proportional positioning from top
            right: size.width * 0.01,
            child: Container(
              width: size.width, // Full width of the screen
              height: size.height, // Full height of the screen
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/bg_images/LooperBG.png'), // Path to your background image
                  fit: BoxFit.contain, // Fitting the image in the container
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
          ),
          // Center logo and text widgets
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Gif widget
                Container(
                  height: size.height * 0.4,
                  // Keeping square aspect ratio
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image), // Path to your gif
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                kHeight(context, 0.02),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: CustomText(
                    text: textOne,
                    textAlign: TextAlign.center,
                    fontSize: getResponsiveFontSize(context, 24),
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),

                kHeight(context, 0.01),
                SizedBox(
                  height: size.height *
                      0.01, // Proportional spacing between logo and text
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                  child: CustomText(
                    text: textTwo,
                    textAlign: TextAlign.center,
                    fontSize: getResponsiveFontSize(context, 24),
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffB08900),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
