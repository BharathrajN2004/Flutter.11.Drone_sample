import 'package:flutter/material.dart';

class CustomTheme {
  final double height;
  final double width;
  final double aspectratio;

  CustomTheme(
      {required this.height, required this.width, required this.aspectratio});

  factory CustomTheme.fromContext(BuildContext context) {
    final double aspectratio = MediaQuery.of(context).size.aspectRatio;
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return CustomTheme(aspectratio: aspectratio, height: height, width: width);
  }
}
