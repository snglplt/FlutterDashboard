import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:selparteknolojidna/controller/dashboard_controller.dart';

import '../app/ui/dash_board_screen/dash_board_screen.dart';
import '../app/ui/into_screen/intro_screen.dart';
import '../app/ui/login_screen/get_started_screen.dart';
import '../services/notification_service.dart';
import '../services/preferences.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    notificationInit();
    Timer(const Duration(seconds: 3), () => redirectScreen());
    super.onInit();
  }

  redirectScreen() async {
    bool isLogin = Preferences.getBoolean(Preferences.isLogin);
    final DashBoardController dataController = Get.put(DashBoardController());
    if (isLogin == true) {
      Get.offAll( DashBoardScreen(ad:dataController.myData.value,username:dataController.username.value,uid:dataController.uid.value),transition: Transition.rightToLeftWithFade);
    } else {
      bool isOnBoarding = Preferences.getBoolean(Preferences.isFinishOnBoardingKey);
      if (isOnBoarding) {
        Get.offAll(const GetStatedScreen(),transition: Transition.rightToLeftWithFade);
      } else {
        Get.offAll(const IntroScreen(),transition: Transition.rightToLeftWithFade);
      }
    }
  }

  NotificationService notificationService = NotificationService();

  notificationInit() {
    notificationService.initInfo().then((value) async {
      String token = await NotificationService.getToken();
      log(":::::::TOKEN:::::: $token");

    });
  }
}
