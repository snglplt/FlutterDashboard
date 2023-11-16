import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:selparteknolojidna/app/ui/login_screen/login_screen.dart';

import '../../../them/app_them_data.dart';
import '../../../them/responsive.dart';
import '../../../widgets/round_button_fill.dart';
import '../signup_screen/signup_screen.dart';

class GetStatedScreen extends StatelessWidget {
  const GetStatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Responsive.height(100, context),
        width: Responsive.width(100, context),
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/img/mechanic-servicing-car.jpg"), fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Selpar Mobile Hoşgeldiniz".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppThemData.white,
                  fontSize: 24,
                  letterSpacing: -0.48,
                  fontFamily: AppThemData.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Selpar Mobile ile ayrıcalıkları yaklayın.Üretin,gelişin, geliştirin ".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: AppThemData.regular,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RoundedButtonFill(
                title: "Giriş Yapın".tr,
                color: AppThemData.foodAppOrange600,
                onPress: () {
                  Get.to(const LoginScreen(), transition: Transition.rightToLeftWithFade);
                },
              ),
              const SizedBox(
                height: 12,
              ),/*
              RoundedButtonFill(
                title: "Continue with Facebook".tr,
                color: AppThemData.white,
                textColor: AppThemData.assetColorGrey600,
                fontFamily: AppThemData.bold,
                isRight: false,
                icon: SvgPicture.asset("assets/icons/ic_facebook_food.svg"),
                onPress: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              RoundedButtonFill(
                title: "Continue with Google".tr,
                color: AppThemData.white,
                textColor: AppThemData.assetColorGrey600,
                fontFamily: AppThemData.bold,
                isRight: false,
                icon: SvgPicture.asset("assets/icons/ic_google_food.svg"),
                onPress: () {},
              ),
              const SizedBox(
                height: 52,
              ),*/
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: "${'Hesabınız yok mu?'.tr} ",
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: AppThemData.regular,
                      color: AppThemData.white,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(const SignupScreen(), transition: Transition.rightToLeftWithFade);
                          },
                        text: 'Kayıt Ol'.tr,
                        style: const TextStyle(
                          color: AppThemData.foodAppOrange600,
                          fontSize: 14,
                          fontFamily: AppThemData.regular,
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
      ),
    );
  }
}
