import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/intro_screen_controller.dart';
import '../../../services/preferences.dart';
import '../../../them/app_them_data.dart';
import '../../../them/responsive.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/round_button_fill.dart';
import '../login_screen/get_started_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetX(
      init: IntroScreenController(),
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Image.asset(
                controller.selectedPageIndex.value == 0
                    ? controller.onBoardingList[0].image.toString()
                    : controller.selectedPageIndex.value == 1
                        ? controller.onBoardingList[1].image.toString()
                        : controller.onBoardingList[2].image.toString(),
                width: Responsive.width(100, context),
                height: Responsive.width(130, context),
                fit: BoxFit.fill,
              ),
              Expanded(
                child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.selectedPageIndex,
                    itemCount: controller.onBoardingList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 48,
                                ),
                                Text(
                                  controller.onBoardingList[index].title.toString().tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                    fontSize: 24,
                                    letterSpacing: -0.48,
                                    fontFamily: AppThemData.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  controller.onBoardingList[index].description.toString().tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    height: 1.1,
                                    color: AppThemData.assetColorLightGrey1000,
                                    fontSize: 16,
                                    fontFamily: AppThemData.regular,
                                  ),
                                ),
                                const SizedBox(
                                  height: 36,
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      controller.onBoardingList.length,
                                      (index) => Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 4),
                                          width: controller.selectedPageIndex.value == index ? 38 : 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: controller.selectedPageIndex.value == index ? AppThemData.foodAppOrange600 : AppThemData.foodAppOrange400,
                                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                                          )),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: RoundedButtonFill(
                                        title: "Atla".tr,
                                        color: AppThemData.assetColorLightGrey600,
                                        textColor: AppThemData.assetColorLightGrey1000,
                                        onPress: () {
                                          Preferences.setBoolean(Preferences.isFinishOnBoardingKey, true);
                                          Get.offAll(const GetStatedScreen(),transition: Transition.rightToLeftWithFade);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    Expanded(
                                      child: RoundedButtonFill(
                                        title: "İleri".tr,
                                        color: AppThemData.foodAppOrange600,
                                        onPress: () {
                                          if (controller.selectedPageIndex.value == 2) {
                                            Preferences.setBoolean(Preferences.isFinishOnBoardingKey, true);
                                            Get.offAll(const GetStatedScreen(),transition: Transition.rightToLeftWithFade);
                                          } else {
                                            controller.pageController.jumpToPage(controller.selectedPageIndex.value + 1);
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
