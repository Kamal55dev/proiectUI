import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_team_management/controller/team_management_controller.dart';
import 'package:badminton/modules/coach_module/coach_team_management/views/coach_screen.dart';
import 'package:badminton/modules/coach_module/coach_team_management/views/players_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// TeamDetailsScreen using ConsumerStatefulWidget
class TeamDetailsScreen extends ConsumerStatefulWidget {
  const TeamDetailsScreen({super.key});

  @override
  _TeamDetailsScreenState createState() => _TeamDetailsScreenState();
}

class _TeamDetailsScreenState extends ConsumerState<TeamDetailsScreen> {
  List<String> menuNames = [
    'Players',
    'Coaches',
    'Attendance',
  ];

  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;

    final selectedIndex = ref.watch(createteamControllerProvider).selectedIndex;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: CustomText(
          text: 'Boys Under 14',
          color: white,
          fontSize: getResponsiveFontSize(context, 18),
          fontWeight: FontWeight.w700,
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
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topLeft,
                    heightFactor: 0.9,
                    widthFactor: 0.9,
                    child: Image.asset(
                      height: kheight * 0.4,
                      width: double.infinity,
                      'assets/images/bg_images/Looper BG.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: responsiveSidePadding(
                    context,
                    leftFactor: 0.04,
                    rightFactor: 0.03,
                    topFactor: 0.08,
                  ),
                  child: SizedBox(
                    height: kheight * 0.15,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: menuNames.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            ref
                                .read(createteamControllerProvider)
                                .updateSelectedIndex(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: kwidth * 0.025),
                            height: kheight * 0.4,
                            width: kwidth * 0.3,
                            decoration: BoxDecoration(
                              color: boxColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: selectedIndex == index
                                    ?primaryColor
                                    : grey,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.groups_rounded,
                                  color: selectedIndex == index
                                    ?primaryColor
                                    : white,
                                  size: kwidth * 0.09,
                                ),
                                SizedBox(height: kheight * 0.01),
                                CustomText(
                                  text: menuNames[index],
                                  fontSize:
                                      getResponsiveFontSize(context, 14),
                                  color:selectedIndex == index
                                    ?primaryColor
                                    :white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    
                  ),
                  
                  
                ),
                  Padding(
              padding: responsiveSidePadding(context, leftFactor: 0.04, topFactor: 0.5),
              child: _buildSelectedWidget(selectedIndex),
            ),
                
              ],
            ),
           
          ],
        ),
      ),
    );
  }
}
 Widget _buildSelectedWidget(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const PlayersScreen();
      case 1:
        return const CoachScreen();
      // case 2:
      //   return _buildAttendanceWidget();
      default:
        return Container();
    }
  }
