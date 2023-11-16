import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/banner_model.dart';
import '../model/category_model.dart';
import '../model/home_model.dart';
import '../model/user_model.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController(viewportFraction: 0.95, keepPage: true);
  var selectedPageIndex = 0.obs;

  Rx<HomeModel> homeModel = HomeModel().obs;
  Rx<CategoryModel> categoryModel = CategoryModel().obs;
  Rx<UserModel> userModel = UserModel().obs;
  Rx<BannerModel> bannerModel = BannerModel().obs;

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    autoChangeTimer();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.bannerJson).then((value) {
      bannerModel.value = BannerModel.fromJson(value);
    });

    await Constant.loadJson(path: Constant.homeJson).then((value) {
      homeModel.value = HomeModel.fromJson(value);
    });

    await Constant.loadJson(path: Constant.categoryJson).then((value) {
      categoryModel.value = CategoryModel.fromJson(value);
    });

    await Constant.loadJson(path: Constant.userJson).then((value) {
      userModel.value = UserModel.fromJson(value);
    });
    isLoading.value = false;
  }

  autoChangeTimer() {
    Timer.periodic(
      const Duration(seconds: 3),
      (Timer timer) {
        if (selectedPageIndex < bannerModel.value.banner!.length - 1) {
          selectedPageIndex.value++;
        } else {
          selectedPageIndex.value = 0;
        }

        pageController.animateToPage(
          selectedPageIndex.value,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
