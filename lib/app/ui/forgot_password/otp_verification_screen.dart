import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/forgot_password/create_new_password.dart';

import '../../../controller/forgot_password_controller.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/round_button_fill.dart';

class OTPVerificationScreen extends StatelessWidget {
  const OTPVerificationScreen({super.key});

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
                    "Verification Code".tr,
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
                    "Check your email for the verification code and enter it here to secure your account.".tr,
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
                  Pinput(
                    keyboardType: TextInputType.number,
                    length: 6,
                    controller: controller.pinController.value,
                    androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: TextStyle(
                        fontSize: 22,
                        color: themeChange.getThem() ? AppThemData.assetColorGrey600 : AppThemData.assetColorGrey600,
                      ),
                      decoration: BoxDecoration(
                        color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    focusedPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: AppThemData.foodAppOrange600)),
                    ),
                    separatorBuilder: (index) => const SizedBox(width: 8),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  RoundedButtonFill(
                    title: "Verify and Continue".tr,
                    color: AppThemData.foodAppOrange600,
                    textColor: AppThemData.white,
                    fontFamily: AppThemData.bold,
                    onPress: () {
                      Get.off(const CreateNewPasswordScreen(),transition: Transition.rightToLeftWithFade);
                    },
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Center(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: "${'Didn’t get the OTP?'.tr} ",
                        style: const TextStyle(
                          fontFamily: AppThemData.medium,
                          color: AppThemData.assetColorLightGrey1000,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            text: 'Resend'.tr,
                            style: const TextStyle(
                              color: AppThemData.foodAppOrange600,
                              fontFamily: AppThemData.medium,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
