import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/custom_navigationbar.dart';
import 'package:badminton/modules/orientation_module/orientation_home/orientation_dashboard.dart';
import 'package:flutter/material.dart';

class OrientationHome extends StatefulWidget {
  const OrientationHome({super.key});

  @override
  State<OrientationHome> createState() => _OrientationHomeState();
}

class _OrientationHomeState extends State<OrientationHome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF202326),
        appBar: const CustomNavigationBar(),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              top: -100,
              // left: 50,
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_images/LooperBG2.png'),
                    alignment: Alignment.topLeft,
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.04), // Uniform padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: size.height * 0.02), // Padding below the Row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width * 0.3, // Responsive width
                          height: size.width * 0.3, // Responsive height
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/bg_images/logo.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width * 0.9, // Responsive width
                    height: size.height * 0.15, // Responsive height
                    child: Card(
                      color: const Color(0x39434F66),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            size.width * 0.02), // Responsive border radius
                      ),
                      margin: EdgeInsets.only(
                          bottom: size.height * 0.02), // Margin below the card
                      child: Padding(
                        padding: EdgeInsets.all(size.width *
                            0.04), // Uniform padding inside the card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Orientation',
                              textAlign: TextAlign.center,
                              fontSize: getResponsiveFontSize(context,
                                  size.width * 0.05), // Responsive font size
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            SizedBox(
                                height:
                                    size.height * 0.01), // Responsive spacing
                            CustomText(
                              text: 'Team',
                              textAlign: TextAlign.center,
                              fontSize: getResponsiveFontSize(context,
                                  size.width * 0.04), // Responsive font size
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height * 0.02), // Padding above the GridView
                    child: Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics:
                            const NeverScrollableScrollPhysics(), // No scroll
                        crossAxisCount: 2,
                        mainAxisSpacing:
                            size.width * 0.04, // Responsive spacing
                        crossAxisSpacing:
                            size.width * 0.04, // Responsive spacing
                        childAspectRatio: size.width /
                            (size.height * 0.17), // Responsive aspect ratio
                        // childAspectRatio: 2.7,
                        children: [
                          DashboardCard(
                            imagePath:
                                'assets/images/icon_images/arcticons_warden.png',
                            label: 'Academies',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/academies');
                            },
                          ),
                          DashboardCard(
                            imagePath:
                                'assets/images/icon_images/carbon_event.png',
                            label: 'Events',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/events');
                            },
                          ),
                          DashboardCard(
                            imagePath: 'assets/images/icon_images/Player.png',
                            label: 'Players',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/players');
                            },
                          ),
                          DashboardCard(
                            imagePath: 'assets/images/icon_images/Coach.png',
                            label: 'Coaches',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/coaches');
                            },
                          ),
                          DashboardCard(
                            imagePath: 'assets/images/icon_images/money.png',
                            label: 'Subscriptions',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/subscriptions');
                            },
                          ),
                          DashboardCard(
                            imagePath: 'assets/images/icon_images/Group.png',
                            label: 'Requests',
                            onPressed: () {
                              // Navigator.pushNamed(context, '/requests');
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             OreRaqSuccessScreen()));
                            },
                          ),
                        ],
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
