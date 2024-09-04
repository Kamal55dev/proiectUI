import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final bool obscureText;
  final Color cursorColor;
  final Color textcolor;
  final Color? fillColor;
  final Widget? child;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool textCapitalizationEnabled;
  final bool readOnly;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;

  const CustomFormField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.borderRadius,
    this.width,
    this.height,
    this.obscureText = false,
    this.cursorColor = Colors.grey,
    this.textcolor = Colors.black,
    this.child,
    this.fillColor,
    this.inputType,
    this.inputFormatters,
    this.textCapitalizationEnabled = false,
    this.readOnly = false,
    this.length,
    this.validator,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final kheight = MediaQuery.of(context).size.height;
    final kwidth = MediaQuery.of(context).size.width;
    List<TextInputFormatter>? effectiveInputFormatters = inputFormatters;
    if (length != null) {
      effectiveInputFormatters ??= <TextInputFormatter>[];
      effectiveInputFormatters.add(LengthLimitingTextInputFormatter(length));
    }

    return IntrinsicHeight(
      child: SizedBox(
        height: height,
        width: width,
        child: TextFormField(
          style: TextStyle(fontSize: 18, color: textcolor),
          textCapitalization: textCapitalizationEnabled ? TextCapitalization.characters : TextCapitalization.none,
          obscureText: obscureText,
          controller: controller,
          keyboardType: inputType,
          inputFormatters: effectiveInputFormatters,
          readOnly: readOnly,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillColor,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.symmetric(
              vertical: kheight * 0.015,
              horizontal: kwidth * 0.02,
            ),
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.grey[200],
              fontSize: 14.0,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(4.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(4.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(4.0),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(4.0),
            ),
            suffixIcon: child,
          ),
          cursorColor: cursorColor,
        ),
      ),
    );
  }
}
