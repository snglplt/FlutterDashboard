import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../them/app_them_data.dart';
import '../utils/dark_theme_provider.dart';

class CommonUI {
  static AppBar customAppBar(
    BuildContext context, {
    Widget? title,
    bool isBack = true,
    Color? backgroundColor,
    Color iconColor = AppThemData.assetColorLightGrey1000,
    Color textColor = AppThemData.assetColorLightGrey600,
    List<Widget>? actions,
    Function()? onBackTap,
  }) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return AppBar(
      title: title ??
          Text(
            "",
            style: TextStyle(color: textColor, fontFamily: AppThemData.semiBold, fontSize: 18),
          ),
      backgroundColor: themeChange.getThem() ? backgroundColor ?? AppThemData.assetColorGrey1000 : backgroundColor ?? AppThemData.white,
      automaticallyImplyLeading: isBack,
      elevation: 0,
      centerTitle: false,
      titleSpacing: isBack == true ? 0 : 16,
      leading: isBack
          ? InkWell(
              onTap: onBackTap ??
                  () {
                    Get.back();
                  },
              child: Icon(Icons.arrow_back, color: themeChange.getThem() ? AppThemData.white : iconColor),
            )
          : null,
      actions: actions,
    );
  }
}
