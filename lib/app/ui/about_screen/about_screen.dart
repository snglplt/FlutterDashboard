import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: CommonUI.customAppBar(context,
          title: Text(
            "About",
            style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
          ),
          isBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(children: [
          aboutView(title: "Terms of Services", themeChange: themeChange),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: AppThemData.assetColorGrey300,
            ),
          ),
          aboutView(title: "Privacy Policy", themeChange: themeChange),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(
              color: AppThemData.assetColorGrey300,
            ),
          ),
        ]),
      ),
    );
  }

  Widget aboutView({required String title, themeChange}) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title.tr,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
              fontSize: 16,
              fontFamily: AppThemData.semiBold,
            ),
          ),
        ),
        SvgPicture.asset("assets/icons/ic_right_food.svg"),
      ],
    );
  }
}
