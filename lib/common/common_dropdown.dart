import 'package:badminton/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final String? value;
  final List<String> items;
  final void Function(String?) onChanged;
  final BorderRadius? borderRadius;
  final String? Function(String?)? validator;
  final Color? hintColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool isReadOnly;
  final double? height;
  final double? width;
  final Icon? customIcon;
  final Widget Function(String)? itemBuilder;
  final Icon? prefixIcon;
  final double? prefixIconSize;
  final Color? prefixIconColor;
  final Color? borderColor;

  const CustomDropdown({
    super.key,
    required this.hintText,
    required this.value,
    required this.items,
    required this.onChanged,
    this.borderRadius,
    this.backgroundColor,
    this.iconColor,
    this.hintColor,
    this.validator,
    this.isReadOnly = false,
    this.height,
    this.width,
    this.customIcon,
    this.itemBuilder,
    this.prefixIcon,
    this.prefixIconSize,
    this.prefixIconColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.06,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        border: Border.all(color: borderColor ?? Colors.black.withOpacity(0.1)),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: white,
        focusColor: white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon!.icon,
                  size: prefixIconSize ?? 24,
                  color: prefixIconColor ?? Colors.black,
                )
              : null,
        ),
        icon: customIcon ?? Icon(Icons.keyboard_arrow_down_outlined, color: iconColor),
        value: value,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: itemBuilder != null ? itemBuilder!(item) : Text(item, style: const TextStyle(fontSize: 11.5)),
          );
        }).toList(),
        onChanged: isReadOnly ? null : onChanged,
        validator: validator,
      ),
    );
  }
}
