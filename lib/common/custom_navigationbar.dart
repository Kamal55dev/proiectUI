// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      // color: const Color(0xFF1C1C1C), // Background color of the AppBar
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust size to minimum required
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.04), // Responsive horizontal padding
            child: AppBar(
              backgroundColor: const Color(0x212620), // Make AppBar transparent
              elevation: 0,
              leading: Padding(
                padding:
                    EdgeInsets.all(size.width * 0.02), // Responsive padding
                child: CircleAvatar(
                  backgroundColor:
                      Colors.grey, // Background color of the avatar
                  radius: size.width * 0.1, // Responsive radius
                  backgroundImage: const AssetImage(
                      'assets/images/profile_image/user_profile_image.png'), // Your avatar image
                ),
              ),
              title: CustomText(
                text: 'RAK',
                textAlign: TextAlign.center,
                fontSize:
                    getResponsiveFontSize(context, 18), // Responsive font size
                fontWeight: FontWeight.w600,
                color: white,
              ),
              centerTitle: true,
              actions: [
                SizedBox(
                  height: size.height *
                      0.04, // Responsive height for vertical divider
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: size.width * 0.002, // Responsive thickness
                    indent: size.width * 0.02, // Responsive indent
                    endIndent: size.width * 0.02, // Responsive endIndent
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(size.width * 0.01), // Responsive padding
                  child: SizedBox(
                    height: size.width * 0.1, // Responsive height
                    child: IconButton(
                      iconSize: size.width * 0.07, // Responsive icon size
                      icon: Image.asset(
                        'assets/images/icon_images/Bell.png', // Your custom image for the icon
                        fit: BoxFit.cover,
                      ),
                      onPressed: () {
                        // Add your onPressed function here
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.02), // Responsive margin
            height: size.height * 0.002, // Responsive height for the divider
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.grey
                      .withOpacity(0), // Start transparent for the thin ends
                  Colors.grey.withOpacity(0.2), // Center is thicker
                  Colors.grey.withOpacity(0), // End transparent for thin ends
                ],
                stops: const [0.0, 0.5, 1.0], // Defines the transition points
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 2); // Fixed extra height for the divider
}
