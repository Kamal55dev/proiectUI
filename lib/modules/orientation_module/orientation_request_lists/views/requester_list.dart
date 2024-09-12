import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/custom_appbar.dart';
import 'package:badminton/common/custom_tab_bar.dart';
import 'package:badminton/modules/orientation_module/orientation_request_lists/widgets/requester_list_view.dart';
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
    const IconData leadingIcon = Icons.arrow_back;
    const String actionImage = 'assets/images/icon_images/Action Icons.png';

    return SafeArea(
      child: Scaffold(
        backgroundColor:
            const Color(0xFF202326), // Background color for the screen
        body: Stack(
          children: [
            // Background image positioned behind everything
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

            // Main content overlaid on top of the background
            Padding(
              padding: responsiveAllPadding(context, 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Custom AppBar at the top
                  Padding(
                    padding: responsiveAllPadding(context, 0.01),
                    child: CustomAppbar(
                      actionImage, // Image path for the action icon
                      leadingIcon: leadingIcon, // Leading icon (arrow_back)
                      title: 'Requesters List',
                      onTap: () {
                        // Action for leading icon tap (e.g., navigate back)
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  SizedBox(
                    height: size.height * 0.1,
                    child: const CustomTabBar(),
                  ),
                  const Flexible(
                    child: RequesterListView(),
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
