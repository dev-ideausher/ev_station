import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ResponsiveSize on num {
  static const double scaleFactorH = 0.123; //100/devide screen height
  static const double scalefactorW = 0.266; //100/device screen width

  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * Get.height / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * Get.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get ksp => this * (Get.width / 3) / 100;

  /// Calculates the number of pixel depending on the device's screen size
  ///
  /// Eg: 20.kh -> will take 20 logical pixel of the screen's height
  double get kh => (this * Get.height * scaleFactorH) / 100;

  /// Calculates the number of pixel depending on the device's screen size
  ///
  /// Eg: 20.kw -> will take 20 logical pixel of the screen's width
  double get kw => (this * Get.width * scalefactorW) / 100;

  ///Create a SizedBox widget with height provided in number of pixels
  ///
  ///Eg: 20.kheightBox creates a SizedBox with height 20.kh
  Widget get kheightBox => SizedBox(height: kh);

  ///Create a SizedBox widget with width provided in number of pixels
  ///
  ///Eg: 20.kwidthBox creates a SizedBox with width 20.kw
  Widget get kwidthBox => SizedBox(width: kw);

  EdgeInsetsGeometry get paddingAll => EdgeInsets.all(kh);

  EdgeInsetsGeometry get paddingLeft => EdgeInsets.only(left: kw);

  EdgeInsetsGeometry get paddingRight => EdgeInsets.only(right: kw);

  EdgeInsetsGeometry get paddingBottom => EdgeInsets.only(bottom: kh);

  EdgeInsetsGeometry get paddingTop => EdgeInsets.only(top: kh);

  EdgeInsetsGeometry get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: kw);

  EdgeInsetsGeometry get paddingVertical => EdgeInsets.symmetric(vertical: kh);
}

EdgeInsets paddingOnly({
  double left = 0,
  double right = 0,
  double top = 0,
  double bottom = 0,
}) =>
    EdgeInsets.only(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
    );
EdgeInsets paddingSymmetric({
  double horizontal = 0,
  double vertical = 0,
}) =>
    EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
