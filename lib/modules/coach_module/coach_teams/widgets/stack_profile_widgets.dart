import 'package:badminton/common/common_font_size.dart';
import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class StackProfileWidget extends StatelessWidget {
  final List<String> names;
  final List<Color> colors;

  const StackProfileWidget({
    super.key,
    required this.names,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Stack(
        children: [
          CircleAvatar(
            radius: 13,
            backgroundColor: colors[0],
            child: Text(
              names[0][0],
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, 11),
                color: black,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 15,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: colors[1],
              child: Text(
                names[1][0],
                style: TextStyle(
                  color: black,
                  fontSize: getResponsiveFontSize(context, 11),
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: colors[2],
              child: Text(
                names[2][0],
                style: TextStyle(
                  color: black,
                  fontSize: getResponsiveFontSize(context, 11),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
