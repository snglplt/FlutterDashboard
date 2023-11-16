import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/dashboard_controller.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';

class DashBoardScreen extends StatelessWidget {
  final String ad;
  final String username;
  final String uid;
  const DashBoardScreen({required this.ad, required  this.username, required  this.uid, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetX<DashBoardController>(
        init: DashBoardController(),
        builder: (controller) {
          controller=Get.put(DashBoardController());
         // controller.initState(this.ad);
          return Scaffold(
            // body: controller.pageList[controller.selectedIndex.value],
            body: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (value) {
                controller.selectedIndex.value = value;
                controller.initState(this.ad,this.username,this.uid);
              },
              itemCount: controller.pageList.length,
              itemBuilder: (context, index) {
                return controller.pageList[controller.selectedIndex.value];
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              currentIndex: controller.selectedIndex.value,
              backgroundColor: themeChange.getThem() ? AppThemData.assetColorGrey1000 : AppThemData.white,
              selectedItemColor: AppThemData.foodAppOrange600,
              unselectedItemColor: AppThemData.assetColorLightGrey1000,
              onTap: controller.onItemTapped,
              items: [
                navigationBarItem(
                  index: 0,
                  assetIcon: "assets/icons/ic_home_food.svg",
                  label: 'Home'.tr,
                  controller: controller,
                ),
                navigationBarItem(
                  index: 1,
                  assetIcon: "assets/icons/ic_cart_food.svg",
                  label: 'Asistan'.tr,
                  controller: controller,
                ),
                navigationBarItem(
                  index: 2,
                  assetIcon: "assets/icons/ic_search_food.svg",
                  label: 'Search'.tr,
                  controller: controller,
                ),
                navigationBarItem(
                  index: 3,
                  assetIcon: "assets/icons/ic_orders_food.svg",
                  label: 'Orders'.tr,
                  controller: controller,
                ),
                navigationBarItem(
                  index: 4,
                  assetIcon: "assets/icons/ic_user_food.svg",
                  label: 'Profile'.tr,
                  controller: controller,
                ),
              ],
            ),
          );
        });
  }

  BottomNavigationBarItem navigationBarItem({required int index, required String label, required String assetIcon, required DashBoardController controller}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: SvgPicture.asset(
          assetIcon,
          height: 22,
          width: 22,
          colorFilter: ColorFilter.mode(
            controller.selectedIndex.value == index ? AppThemData.foodAppOrange600 : AppThemData.assetColorLightGrey1000,
            BlendMode.srcIn,


          ),


        ),
      ),
      label: label,
    );
  }
}
