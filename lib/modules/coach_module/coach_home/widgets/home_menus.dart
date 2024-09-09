import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeMenu extends ConsumerWidget {
  const HomeMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> menuNames = ['Schedule', 'Teams', 'Matches', 'Wellness'];
    List<IconData> menuIcons = [Icons.schedule, Icons.people, Icons.sports_tennis, Icons.favorite];

    var kheight = MediaQuery.of(context).size.height;
    var kwidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: responsiveSidePadding(
        context,
        leftFactor: 0.04,
        rightFactor: 0.03,
        topFactor: 0.01,
      ),
      child: Column(
        children: [
          SizedBox(
            height: kheight * 0.085,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const ScrollPhysics(),
              itemCount: menuNames.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: kwidth * 0.05),
                  height: kheight * 0.1,
                  width: kwidth * 0.193,
                  decoration: BoxDecoration(
                    color: boxColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        menuIcons[index],
                        color: white,
                        size: 28, 
                      ),
                      SizedBox(height: kheight * 0.01), 
                      CustomText(
                        text: menuNames[index],
                        fontSize: getResponsiveFontSize(context, 14), 
                        color: white,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
