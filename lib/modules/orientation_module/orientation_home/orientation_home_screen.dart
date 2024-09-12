import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/common/custom_navigationbar.dart';
import 'package:badminton/modules/orientation_module/orientation_home/orientation_dashboard.dart';
import 'package:badminton/modules/orientation_module/orientation_request_lists/views/requester_list.dart';
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
              child: Container(
                height: size.height,
                width: size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_images/LooperBG2.png'),
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Remove any unnecessary height between the navigation bar and the logo
                  // SizedBox(height: size.height * 0.1), // Minimal spacing

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: size.width * 0.3,
                        height: size.height * 0.15,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/bg_images/logo.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                      height:
                          size.height * 0.01), // Adjust this spacing as needed

                  // The card content starts here
                  SizedBox(
                    width: size.width * 0.9,
                    height: size.height * 0.15,
                    child: Card(
                      color: const Color(0x39434F66),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                      ),
                      margin: EdgeInsets.only(bottom: size.height * 0.02),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Orientation',
                              textAlign: TextAlign.center,
                              fontSize: getResponsiveFontSize(
                                  context, size.width * 0.05),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            SizedBox(height: size.height * 0.01),
                            CustomText(
                              text: 'Team',
                              textAlign: TextAlign.center,
                              fontSize: getResponsiveFontSize(
                                  context, size.width * 0.04),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: size.width * 0.04,
                      crossAxisSpacing: size.width * 0.04,
                      childAspectRatio: size.width / (size.height * 0.17),
                      children: [
                        DashboardCard(
                          imagePath:
                              'assets/images/icon_images/arcticons_warden.png',
                          label: 'Academies',
                          onPressed: () {},
                        ),
                        DashboardCard(
                          imagePath:
                              'assets/images/icon_images/carbon_event.png',
                          label: 'Events',
                          onPressed: () {},
                        ),
                        DashboardCard(
                          imagePath: 'assets/images/icon_images/Player.png',
                          label: 'Players',
                          onPressed: () {},
                        ),
                        DashboardCard(
                          imagePath: 'assets/images/icon_images/Coach.png',
                          label: 'Coaches',
                          onPressed: () {},
                        ),
                        DashboardCard(
                          imagePath: 'assets/images/icon_images/money.png',
                          label: 'Subscriptions',
                          onPressed: () {},
                        ),
                        DashboardCard(
                          imagePath: 'assets/images/icon_images/Group.png',
                          label: 'Requests',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RequesterList()),
                            );
                          },
                        ),
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
