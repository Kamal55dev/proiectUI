import 'package:badminton/common/common_size.dart';
import 'package:badminton/modules/orientation_module/orientation_coach_connekt/views/coach_connekt_screen.dart';
import 'package:badminton/modules/orientation_module/orientation_reqsuccess_screen.dart';
import 'package:badminton/modules/orientation_module/orientation_request_lists/views/requester_list.dart';
import 'package:flutter/material.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/core/utils/colors.dart';

class RequesterAlertDialog extends StatelessWidget {
  final Map<String, dynamic> requester;

  const RequesterAlertDialog({Key? key, required this.requester})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: const Color(0xFF39434F),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: const Color(0xFFB08900), width: 2),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(requester['image']),
                  ),
                ),
                // SizedBox(height: 20),
                kHeight(context, 0.015),
                CustomText(
                  text: requester['name'],
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: getResponsiveFontSize(context, 16),
                ),
                kHeight(context, 0.01),
                IntrinsicWidth(
                  child: Container(
                    // height: size.height * 0.03,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width *
                            0.02), // Dynamic width padding
                    decoration: BoxDecoration(
                      color: requester['levelColor'],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: CustomText(
                        text: requester['level'],
                        fontSize: getResponsiveFontSize(context, 14),
                        color: white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),

                kHeight(context, 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icon_images/location.png',
                      width: 24,
                      height: 24,
                    ),
                    kWidth(context, 0.02),
                    CustomText(
                      text: requester['location'],
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, 12),
                    ),
                  ],
                ),
                kHeight(context, 0.01),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle Waiting List action
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OreRaqSuccessScreen(
                                image: 'assets/gif/sand_clock_loader.png',
                                textOne: 'This request Moved to',
                                textTwo: 'Waiting List.',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF39434F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(
                              color: Colors.white, // White border color
                              width: 1,
                            ),
                          ),
                        ),
                        child: CustomText(
                          text: 'Waiting List',
                          fontWeight: FontWeight.normal,
                          color: Colors.white, // Text color
                          fontSize: getResponsiveFontSize(context, 12),
                        ),
                      ),
                      kWidth(context, 0.02),
                      ElevatedButton(
                        onPressed: () {
                          // Handle Waiting List action
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CoachConnekt(),
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB08900),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 20, vertical: 12),
                        ),
                        child: CustomText(
                          text: 'Find coaches ',
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: getResponsiveFontSize(context, 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 6,
            top: 4,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.transparent,
                child: Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
