import 'package:flutter/material.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme ? AppThemData.assetColorGrey1000 : AppThemData.assetColorLightGrey400,
      primaryColor: isDarkTheme ? AppThemData.foodAppOrange600 : AppThemData.foodAppOrange600,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    );
  }
}
