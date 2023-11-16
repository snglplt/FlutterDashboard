import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/forgot_password_controller.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/round_button_fill.dart';
import '../../../widgets/text_field_widget.dart';
import 'password_create_successfully_screen.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetBuilder(
        init: ForgotPasswordController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context, isBack: true, backgroundColor: themeChange.getThem() ? AppThemData.assetColorGrey1000 : AppThemData.assetColorLightGrey400),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Create a New Password".tr,
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
                    "Set a strong and secure password for your account to ensure your food orders are safe and sound.".tr,
                    textAlign: TextAlign.start,
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
                  TextFieldWidget(
                    controller: controller.passwordTextFiledController.value,
                    hintText: "Enter New Password",
                    title: "New Password",
                    obscureText: true,
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("assets/icons/ic_password_food.svg", height: 22, width: 22),
                    ),
                  ),
                  TextFieldWidget(
                    controller: controller.conformPasswordTextFiledController.value,
                    hintText: "Enter Confirm Password",
                    title: "Confirm Password",
                    obscureText: true,
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("assets/icons/ic_password_food.svg", height: 22, width: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  RoundedButtonFill(
                    title: "Reset Password".tr,
                    color: AppThemData.foodAppOrange600,
                    textColor: AppThemData.white,
                    fontFamily: AppThemData.bold,
                    onPress: () {
                      Get.off(const PasswordCreateSuccessfullyScreen(),transition: Transition.rightToLeftWithFade);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
