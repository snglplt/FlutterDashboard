import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/round_button_fill.dart';
import '../login_screen/login_screen.dart';

class PasswordCreateSuccessfullyScreen extends StatelessWidget {
  const PasswordCreateSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: CommonUI.customAppBar(context, isBack: false, backgroundColor: AppThemData.assetColorLightGrey400),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/ic_check_icon_food.svg"),
            const SizedBox(
              height: 36,
            ),
            Text(
              "Password Created Successfully".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                fontSize: 24,
                fontFamily: AppThemData.semiBold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Your password has been successfully updated. You're all set to enjoy the Foodie Delight experience with enhanced security.".tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.2,
                color: AppThemData.assetColorLightGrey1000,
                fontSize: 14,
                fontFamily: AppThemData.regular,
              ),
            ),
            const SizedBox(
              height: 36,
            ),
            RoundedButtonFill(
              title: "Continue".tr,
              color: AppThemData.foodAppOrange600,
              textColor: AppThemData.white,
              fontFamily: AppThemData.bold,
              onPress: () {
                Get.offAll(LoginScreen(),transition: Transition.rightToLeftWithFade);
              },
            ),
          ],
        ),
      ),
    );
  }
}
