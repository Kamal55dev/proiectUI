import 'package:flutter/material.dart';

// Helper function to calculate responsive padding
EdgeInsets responsivePadding(BuildContext context, {double horizontalFactor = 0.03, double verticalFactor = 0.02}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return EdgeInsets.symmetric(
    horizontal: screenWidth * horizontalFactor,
    vertical: screenWidth * verticalFactor,
  );
}

// Another helper function to calculate specific side padding
EdgeInsets responsiveSidePadding(BuildContext context,
    {double leftFactor = 0.0, double rightFactor = 0.0, double topFactor = 0.0, double bottomFactor = 0.0}) {
  final screenWidth = MediaQuery.of(context).size.width;
  return EdgeInsets.only(
    left: screenWidth * leftFactor,
    right: screenWidth * rightFactor,
    top: screenWidth * topFactor,
    bottom: screenWidth * bottomFactor,
  );
}

// Helper function to calculate responsive padding for all sides
EdgeInsets responsiveAllPadding(BuildContext context, double factor) {
  final screenWidth = MediaQuery.of(context).size.width;
  return EdgeInsets.all(screenWidth * factor);
}
