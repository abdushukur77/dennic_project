import 'package:flutter/cupertino.dart';

double height = 0.0;
double width = 0.0;

extension Size on int {
  double he() {
    return (this / 812) * height;
  }

  double we() {
    return (this / 375) * width;
  }

  SizedBox getH() {
    return SizedBox(
      height: (this / 812) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 375) * width,
    );
  }
}
