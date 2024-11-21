import 'package:badminton/modules/orientation_module/orientation_request_lists/widgets/alert_dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';

class RequesterListView extends StatefulWidget {
  const RequesterListView({super.key});

  @override
  State<RequesterListView> createState() => _RequesterListViewState();
}

class _RequesterListViewState extends State<RequesterListView> {
  final List<Map<String, dynamic>> requesterData = [
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "Advance",
      "levelColor": Colors.purple,
      "image": 'assets/images/profile_image/Ellipse.png',
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "Beginner",
      "levelColor": Colors.blueAccent,
      "image":
          'assets/images/profile_image/coach_player_home_profile_image.png', // Replace with your asset
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "Advance",
      "levelColor": Colors.orangeAccent,
      "image":
          'assets/images/profile_image/Ellipse2.png', // Replace with your asset
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "intermediate",
      "levelColor": Colors.greenAccent,
      "image":
          'assets/images/profile_image/Ellipse4.png', // Replace with your asset
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "Advance",
      "levelColor": Colors.purple,
      "image":
          'assets/images/profile_image/Ellipse2.png', // Replace with your asset
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "Advance",
      "levelColor": Colors.blueAccent,
      "image":
          'assets/images/profile_image/Ellipse2.png', // Replace with your asset
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "beginner",
      "levelColor": Colors.purple,
      "image":
          'assets/images/profile_image/Ellipse1.png', // Replace with your asset
    },
    {
      "name": "Lee Chong Wei",
      "location": "Kuala Lumpur",
      "level": "Advance",
      "levelColor": Colors.orangeAccent,
      "image":
          'assets/images/profile_image/Ellipse.png', // Replace with your asset
    },
    // Add more entries as needed
  ];

  void _showAlertDialog(BuildContext context, Map<String, dynamic> requester) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RequesterAlertDialog(requester: requester);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      itemCount: requesterData.length,
      separatorBuilder: (context, index) => Divider(
        color: lightGrey,
        thickness: 1,
        indent: 10,
        endIndent: 10,
        height: size.height * 0.04,
      ),
      itemBuilder: (context, index) {
        final requester = requesterData[index];
        return GestureDetector(
          onTap: () => _showAlertDialog(context, requester),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(requester['image']),
                ),
                kWidth(context, 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              horizontal:
                                  size.width * 0.02), // Dynamic width padding
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
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon_images/location.png',
                      width: 30,
                      height: 30,
                    ),
                    kWidth(context, 0.01),
                    CustomText(
                      text: requester['location'],
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
