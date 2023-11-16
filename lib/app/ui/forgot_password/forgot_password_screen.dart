import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/forgot_password/otp_verification_screen.dart';

import '../../../constant/show_toast_dialog.dart';
import '../../../controller/forgot_password_controller.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/round_button_fill.dart';
import '../../../widgets/text_field_widget.dart';
import '../signup_screen/signup_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                    "Welcome Back!".tr,
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
                    "Log in to your account to continue enjoying delicious meals and exclusive offers..".tr,
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

                  const SizedBox(
                    height: 36,
                  ),
                  RoundedButtonFill(
                    title: "Send Email".tr,
                    color: AppThemData.foodAppOrange600,
                    textColor: AppThemData.white,
                    fontFamily: AppThemData.bold,
                    onPress: () {
                      if (controller.emailTextFiledController.value.text.isEmpty) {
                        ShowToastDialog.showToast("Please enter email".tr);
                      } else {
                        Get.to(const OTPVerificationScreen(), transition: Transition.rightToLeftWithFade);
                      }
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${'Don’t have an account?'.tr} ",
                  style: const TextStyle(
                    fontFamily: AppThemData.regular,
                    color: AppThemData.assetColorLightGrey1000,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(const SignupScreen(), transition: Transition.rightToLeftWithFade);
                        },
                      text: 'Sign up'.tr,
                      style: const TextStyle(
                        color: AppThemData.foodAppOrange600,
                        fontFamily: AppThemData.regular,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
