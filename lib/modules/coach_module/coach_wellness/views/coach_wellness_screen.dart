import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CoachWellnessScreen extends StatefulWidget {
  const CoachWellnessScreen({super.key});

  @override
  CoachWellnessScreenState createState() => CoachWellnessScreenState();
}

class CoachWellnessScreenState extends State<CoachWellnessScreen> {
  bool selectAll = false;
  List<bool> selectedItems = List.generate(15, (index) => false);
  List<String> names = List.generate(15, (index) => 'Player $index');

  bool get isAnyItemSelected => selectedItems.contains(true);
  String dropdownvalue = 'Item 1';

  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
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
                text: "Wellness",
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
                    height: size.height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGrey),
                      borderRadius: const BorderRadius.all(Radius.circular(14)),
                      color: tileColor.withOpacity(0.25),
                    ),
                    child: Padding(
                      padding: responsiveSidePadding(context,
                          bottomFactor: 0.01, topFactor: 0.01, leftFactor: 0.03, rightFactor: 0.03),
                      child: Center(
                        child: Theme(
                          data: ThemeData(splashColor: Colors.transparent),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Team Name',
                                hintStyle: TextStyle(color: white),
                                floatingLabelAlignment: FloatingLabelAlignment.center),
                            value: dropdownvalue,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: white,
                            ),
                            dropdownColor: tileColor,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: getResponsiveFontSize(context, 15),
                                fontWeight: FontWeight.w500),
                            items: items.map((String item) {
                              return DropdownMenuItem<String>(
                                alignment: Alignment.center,
                                value: item,
                                child: Text(item.toString()),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: lightGrey),
                  //     borderRadius: const BorderRadius.all(Radius.circular(14)),
                  //     color: tileColor.withOpacity(0.25),
                  //   ),
                  //   child: Padding(
                  //     padding: responsiveAllPadding(context, 0.04),
                  //     child: Row(
                  //       children: [
                  //         Container(
                  //           height: size.height * 0.014,
                  //           width: size.width * 0.032,
                  //           color: blue,
                  //         ),
                  //         kWidth(context, 0.02),
                  //         CustomText(
                  //           text: 'Team Name',
                  //           color: white,
                  //           fontSize: getResponsiveFontSize(context, 15),
                  //           fontWeight: FontWeight.w500,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  kHeight(context, 0.03),
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
                  kHeight(context, 0.03),
                  Expanded(
                    child: ListView.builder(
                      itemCount: names.length,
                      itemBuilder: (context, index) {
                        return Column(
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
                            const Divider(
                              color: grey,
                              thickness: 0.4,
                            ),
                            kHeight(context, 0.02),
                          ],
                        );
                      },
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
