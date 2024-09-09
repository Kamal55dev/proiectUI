import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CoachAttendanceScreen extends StatefulWidget {
  const CoachAttendanceScreen({super.key});

  @override
  CoachAttendanceScreenState createState() => CoachAttendanceScreenState();
}

class CoachAttendanceScreenState extends State<CoachAttendanceScreen> {
  bool selectAll = false;
  List<bool> selectedItems = List.generate(15, (index) => false);
  List<String> names = List.generate(15, (index) => 'Player $index');

  bool get isAnyItemSelected => selectedItems.contains(true);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor,
          title: Row(
            children: [
              kWidth(context, 0.02),
              CustomText(
                text: "Attendance",
                color: white,
                fontSize: getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: grey,
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 0.9,
                widthFactor: 0.9,
                child: SizedBox(
                  height: size.height * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/bg_images/Looper BG.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: responsiveAllPadding(context, 0.03),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGrey),
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      color: tileColor.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: responsiveAllPadding(context, 0.04),
                      child: Row(
                        children: [
                          Container(
                            height: size.height * 0.014,
                            width: size.width * 0.032,
                            color: blue,
                          ),
                          kWidth(context, 0.02),
                          CustomText(
                            text: 'Team Name',
                            color: white,
                            fontSize: getResponsiveFontSize(context, 15),
                            fontWeight: FontWeight.w500,
                          )
                        ],
                      ),
                    ),
                  ),
                  kHeight(context, 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGrey),
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                              color: tileColor.withOpacity(0.25),
                            ),
                            child: Padding(
                              padding: responsiveAllPadding(context, 0.01),
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: white,
                                size: getResponsiveFontSize(context, 12),
                              ),
                            ),
                          ),
                          kWidth(context, 0.03),
                          CustomText(
                            text: 'May 20',
                            color: white,
                            fontSize: getResponsiveFontSize(context, 12),
                          ),
                          kWidth(context, 0.03),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: lightGrey),
                              borderRadius: const BorderRadius.all(Radius.circular(4)),
                              color: tileColor.withOpacity(0.25),
                            ),
                            child: Padding(
                              padding: responsiveAllPadding(context, 0.01),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: white,
                                size: getResponsiveFontSize(context, 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: 'Select All',
                            color: white,
                            fontSize: getResponsiveFontSize(context, 12),
                          ),
                          Checkbox(
                            value: selectAll,
                            checkColor: black,
                            activeColor: white,
                            onChanged: (bool? newValue) {
                              setState(() {
                                selectAll = newValue!;
                                selectedItems = List.generate(selectedItems.length, (_) => selectAll);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage('assets/images/icon_images/attendance icon.png'),
                                    ),
                                    kWidth(context, 0.02),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        CustomText(
                                          text: names[index],
                                          color: white,
                                          fontSize: getResponsiveFontSize(context, 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Checkbox(
                                  checkColor: black,
                                  activeColor: white,
                                  value: selectedItems[index],
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      selectedItems[index] = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const Divider(
                              color: grey,
                              thickness: 0.4,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  CustomButton(
                    height: size.height * 0.06,
                    backgroundColor: isAnyItemSelected ? primaryColor : Colors.transparent,
                    borderColor: grey,
                    borderRadius: 16,
                    child: const CustomText(
                      text: 'Submit',
                      color: white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
