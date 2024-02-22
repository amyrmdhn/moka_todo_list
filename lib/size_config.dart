import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late ThemeData _theme;
  static late double screenWidth;
  static late double screenHeight;
  static late TextTheme textTheme;
  static late ColorScheme colorScheme;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _theme = Theme.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    textTheme = _theme.textTheme;
    colorScheme = _theme.colorScheme;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

TextTheme get textTheme {
  return SizeConfig.textTheme;
}

ColorScheme get colorScheme {
  return SizeConfig.colorScheme;
}
