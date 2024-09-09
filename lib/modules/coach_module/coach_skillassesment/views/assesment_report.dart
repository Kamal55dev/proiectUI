import 'package:badminton/common/common_button.dart';
import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:badminton/modules/coach_module/coach_skillassesment/controller/skillassesment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssesmentReportScreen extends ConsumerWidget {
  const AssesmentReportScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;
    final gradingController = ref.watch(skillControllerProvider);

    List<String> heading = [
      'Footwork',
      'Posture Balance',
      'Racket Skills',
      'Tactical Skills'
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: CustomText(
          text: 'Add Coach',
          color: white,
          fontSize: getResponsiveFontSize(context, 18),
          fontWeight: FontWeight.w500,
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
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: kwidth * 0.04,
            vertical: kheight * 0.045,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Questionnaire',
                    color: white,
                    fontSize: getResponsiveFontSize(context, 16),
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: kwidth * 0.3,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: white,
                    size: kwidth * 0.06,
                  ),
                  CustomText(
                    text: ' 18 Sep 2024',
                    color: white,
                    fontSize: getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: kheight * 0.02,
              ),
              SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    final comment = gradingController.getComment(index);

                    return Container(
                      margin: EdgeInsets.only(bottom: kheight * 0.05),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: primaryColor,
                            width: kwidth * 0.01,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: heading[index],
                            color: white,
                            fontSize: getResponsiveFontSize(context, 16),
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(
                            height: kheight * 0.01,
                          ),
                          RatingStars(
                            value: gradingController.getRating(index),
                            onValueChanged: (v) {
                              ref
                                  .read(skillControllerProvider)
                                  .updateRating(index, v);
                            },
                            starBuilder: (indexStar, color) => Icon(
                              indexStar < gradingController.getRating(index)
                                  ? Icons.star
                                  : Icons.star_border,
                              color:
                                  indexStar < gradingController.getRating(index)
                                      ? primaryColor
                                      : Colors.white,
                            ),
                            starCount: 5,
                            starSize: kwidth * 0.06,
                            valueLabelRadius: 10,
                            maxValue: 5,
                            starSpacing: 2.1,
                            maxValueVisibility: false,
                            valueLabelVisibility: false,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            valueLabelPadding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 8),
                            valueLabelMargin: const EdgeInsets.only(right: 8),
                            starOffColor: const Color(0xffe7e8ea),
                            starColor: primaryColor,
                          ),
                          SizedBox(
                            height: kheight * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  String enteredComment = '';

                                  return Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    child: Container(
                                      height: kheight * 0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        color: black,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Text(
                                              'Add Comment',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: getResponsiveFontSize(
                                                    context, 14),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: TextFormField(
                                              onChanged: (value) {
                                                enteredComment = value;
                                              },
                                              decoration: InputDecoration(
                                                fillColor: boxColor,
                                                suffixIcon: GestureDetector(
                                                  onTap: () {
                                                    ref
                                                        .read(
                                                            skillControllerProvider)
                                                        .updateComment(index,
                                                            enteredComment);
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Icon(
                                                    Icons.comment,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                hintText: 'Comments',
                                                hintStyle: const TextStyle(
                                                    color: grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: grey,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  borderSide: const BorderSide(
                                                    color: grey,
                                                    width: 2.0,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  const TextStyle(color: white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_comment_outlined,
                                  color: grey,
                                  size: kwidth * 0.06,
                                ),
                                SizedBox(width: kwidth * 0.01),
                                CustomText(
                                  text: 'Add Comments',
                                  color: grey,
                                  fontSize: getResponsiveFontSize(context, 14),
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                          ),
                          if (comment.isNotEmpty) ...[
                            SizedBox(height: kheight * 0.01),
                            Row(
                              children: [
                                Container(
                                  height: kheight * 0.045,
                                  width: kwidth * 0.09,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: CustomText(
                                      text: 'JP',
                                      color: Colors.purple,
                                      fontSize:
                                          getResponsiveFontSize(context, 14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: kwidth * 0.02,
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      text: '$comment',
                                      color: white,
                                      fontSize:
                                          getResponsiveFontSize(context, 14),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                          SizedBox(
                            height: kheight * 0.03,
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                            height: kheight * 0.001,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: boxColor,
                    border: Border.all(color: grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: kheight * 0.015,
                    ),
                    CustomButton(
                      borderColor: primaryColor,
                      text: 'Overall Rating',
                      textSize: getResponsiveFontSize(context, 12),
                      textColor: white,
                      backgroundColor: Colors.transparent,
                      borderRadius: 20.0,
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: kwidth * 0.3,
                      onPress: () {},
                    ),
                    SizedBox(
                      height: kheight * 0.015,
                    ),
                    CustomText(
                      text: '-.-',
                      color: white,
                      fontSize: getResponsiveFontSize(context, 16),
                      fontWeight: FontWeight.w800,
                    ),
                    CustomText(
                      text: 'Stars',
                      color: white,
                      fontSize: getResponsiveFontSize(context, 14),
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: kheight * 0.015,
                    ),
                    Row(
mainAxisAlignment: MainAxisAlignment.center,                      children: [
                        Icon(
                          Icons.add_comment_outlined,
                          color: grey,
                          size: kwidth * 0.06,
                        ),
                        SizedBox(width: kwidth * 0.01),
                        CustomText(
                          text: 'Add Comments',
                          color: grey,
                          fontSize: getResponsiveFontSize(context, 14),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: kheight * 0.02,
              ),
              CustomButton(
                borderColor: grey,
                text: 'Submit',
                textSize: getResponsiveFontSize(context, 14),
                textColor: grey,
                backgroundColor: Colors.transparent,
                borderRadius: 20.0,
                height: MediaQuery.of(context).size.height * 0.07,
                width: double.infinity,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
