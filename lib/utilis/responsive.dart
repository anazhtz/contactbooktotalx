import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  final double width;
  final double height;
  final TextScaler textScaler;

  Responsive({required this.context})
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height,
        textScaler = MediaQuery.textScalerOf(context);

  double wp(double percentage) {
    return width * percentage / 100;
  }

  double hp(double percentage) {
    return height * percentage / 100;
  }

  double sp(double fontSize) {
    return textScaler.scale(fontSize);
  }
}

extension ResponsiveExtension on BuildContext {
  Responsive get responsive => Responsive(context: this);
}
