import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Color textcolor;
  final Color fillColor;
  final int maxLines; // Added maxLines parameter

  const CustomFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.textcolor,
    required this.fillColor,
    this.maxLines = 1,  // Default value if not specified
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,  // Applies maxLines to the TextFormField
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      style: TextStyle(color: textcolor),
    );
  }
}
