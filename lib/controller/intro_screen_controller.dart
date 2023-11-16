import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/on_boarding_model.dart';

class IntroScreenController extends GetxController {
  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == onBoardingList.length - 1;
  var pageController = PageController();

  RxBool isLoading = true.obs;
  RxList<OnBoardingModel> onBoardingList = <OnBoardingModel>[].obs;

  @override
  void onInit() {
    getOnBoardingData();
    super.onInit();
  }

  getOnBoardingData() async {
    onBoardingList.add(OnBoardingModel(
      title: "Selpar Mobile İle",
      description: "Aracınız hakkında her şeye erişim sağlayabilirsiniz",
      image: "assets/img/first_image.jpg",
    ));
    onBoardingList.add(OnBoardingModel(
      title: "Selpar Mobile İle",
      description: "Aracınız hakkında her şeye uygulamamız üzerinden erişim sağlayablirsiniz",
      image: "assets/img/customer-text-messaging-mobile.jpg",
    ));
    onBoardingList.add(OnBoardingModel(
      title: "Uygulamamız ile",
      description: "Aracınızın bakımına, takibine tek tıkla ulaşabilirsiniz",
      image: "assets/img/auto-mechanic-working-garage-repair-service.jpg",
    ));

    update();
  }
}
