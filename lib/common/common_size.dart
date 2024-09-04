import 'package:flutter/material.dart';

SizedBox kHeight(BuildContext context, double size) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * size,
  );
}

SizedBox kWidth(BuildContext context, double size) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * size,
  );
}
