// import 'package:badminton/common/common_padding.dart';
// import 'package:badminton/common/custom_appbar.dart';
// import 'package:flutter/material.dart';

// class RequesterList extends StatefulWidget {
//   const RequesterList({super.key});

//   @override
//   State<RequesterList> createState() => _RequesterListState();
// }

// class _RequesterListState extends State<RequesterList> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     // Define the leading icon, title, and image for CustomAppbar
//     final IconData leadingIcon = Icons.arrow_back;
//     final String actionImage = 'assets/images/icon_images/Action Icons.png';

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:
//             const Color(0xFF202326), // Background color for the screen
//         body: Column(
//           children: [
//             // Add CustomAppbar here
//             Padding(
//               padding: responsiveAllPadding(context, 0.03),
//               child: CustomAppbar(
//                 actionImage, // Image path for the action icon
//                 leadingIcon: leadingIcon, // Leading icon (arrow_back)
//                 title: 'Requesters List',
//                 onTap: () {
//                   // Action for leading icon tap (for example, navigate back)
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             // Use Expanded to take up remaining space and use Stack
//             Expanded(
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     top: -100,
//                     child: Container(
//                       height: size.height,
//                       width: size.width,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                               'assets/images/bg_images/LoopeBGreq.png'),
//                           alignment: Alignment.topLeft,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: responsiveAllPadding(context, 0.03),
//                     child: Column(
//                       children: [
//                         // Other widgets can go here
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:badminton/common/common_padding.dart';
// import 'package:badminton/common/custom_appbar.dart';
// import 'package:badminton/common/custom_tab_bar.dart';
// import 'package:flutter/material.dart';
// // Import the separate file where TabBar class is located

// class RequesterList extends StatefulWidget {
//   const RequesterList({super.key});

//   @override
//   State<RequesterList> createState() => _RequesterListState();
// }

// class _RequesterListState extends State<RequesterList> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     // Define the leading icon, title, and image for CustomAppbar
//     final IconData leadingIcon = Icons.arrow_back;
//     final String actionImage = 'assets/images/icon_images/Action Icons.png';

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor:
//             const Color(0xFF202326), // Background color for the screen
//         body: Column(
//           children: [
//             // Add CustomAppbar here
//             Padding(
//               padding: responsiveAllPadding(context, 0.01),
//               child: CustomAppbar(
//                 actionImage, // Image path for the action icon
//                 leadingIcon: leadingIcon, // Leading icon (arrow_back)
//                 title: 'Requesters List',
//                 onTap: () {
//                   // Action for leading icon tap (for example, navigate back)
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//             // Add SizedBox between AppBar and TabBar

//             // Call the CustomTabBar class
//             const CustomTabBar(),

//             Expanded(
//               child: Stack(
//                 children: [
//                   Positioned.fill(
//                     top: -100,
//                     child: Container(
//                       height: size.height,
//                       width: size.width,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(
//                               'assets/images/bg_images/LoopeBGreq.png'),
//                           alignment: Alignment.topLeft,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/custom_appbar.dart';
import 'package:badminton/common/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class RequesterList extends StatefulWidget {
  const RequesterList({super.key});

  @override
  State<RequesterList> createState() => _RequesterListState();
}

class _RequesterListState extends State<RequesterList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Define the leading icon, title, and image for CustomAppbar
    final IconData leadingIcon = Icons.arrow_back;
    final String actionImage = 'assets/images/icon_images/Action Icons.png';

    return SafeArea(
      child: Scaffold(
        backgroundColor:
            const Color(0xFF202326), // Background color for the screen
        body: Column(
          children: [
            // Custom AppBar
            Padding(
              padding: responsiveAllPadding(context, 0.01),
              child: CustomAppbar(
                actionImage, // Image path for the action icon
                leadingIcon: leadingIcon, // Leading icon (arrow_back)
                title: 'Requesters List',
                onTap: () {
                  // Action for leading icon tap (for example, navigate back)
                  Navigator.pop(context);
                },
              ),
            ),

            // Add SizedBox to provide space between AppBar and TabBar
            const SizedBox(height: 16),

            // Custom TabBar
            // const CustomTabBar(),

            // Expanded widget to take up the remaining space
            Expanded(
              child: Stack(
                children: [
                  // Positioned background image
                  Positioned.fill(
                    top: -100,
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/bg_images/LoopeBGreq.png'),
                          alignment: Alignment.topLeft,
                          fit: BoxFit.cover, // Ensure the image fits properly
                        ),
                      ),
                    ),
                  ),

                  // Scrollable content goes here if necessary
                  SingleChildScrollView(
                    padding: responsiveAllPadding(context, 0.03),
                    child: Column(
                      children: [
                        // Other widgets can go here and will be scrollable
                      ],
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
