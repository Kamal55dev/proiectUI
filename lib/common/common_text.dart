import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double?
      lineHeight; // Ensure this has a default value to avoid null issues
  final TextDecoration? decoration;
  final int? maxline;

  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.overflow,
    this.lineHeight,
    this.textAlign,
    this.decoration,
    this.maxline,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxline,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        height: lineHeight, // Use the lineHeight property in TextStyle
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }
}
