import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/common/common_padding.dart';
import 'package:badminton/common/common_size.dart';
import 'package:badminton/common/common_text.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfileCardWidget extends StatelessWidget {
  final String image;
  final String name;
  final String title;
  final String location;
  const ProfileCardWidget({
    super.key,
    required this.image,
    required this.name,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xFF292B2F),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: lightGrey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: size.width * 0.07,
                backgroundImage: AssetImage(image),
              ),
              kWidth(context, 0.03),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: name,
                    color: white,
                    fontSize: getResponsiveFontSize(context, 14),
                  ),
                  kHeight(context, 0.01),
                  Container(
                    padding: responsivePadding(context,
                        verticalFactor: 0.01, horizontalFactor: 0.02),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9254FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: CustomText(
                      text: title,
                      color: white,
                      fontSize: getResponsiveFontSize(context, 12),
                    ),
                  ),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.location_on_outlined,
                  color: Colors.white54,
                  size: getResponsiveFontSize(context, 14)),
              kWidth(context, 0.01),
              CustomText(
                text: location,
                color: Colors.white54,
                fontSize: getResponsiveFontSize(context, 13),
              )
            ],
          )
        ],
      ),
    );
  }
}
