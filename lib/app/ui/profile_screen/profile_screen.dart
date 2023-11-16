import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/about_screen/about_screen.dart';
import 'package:selparteknolojidna/app/ui/address_screen/address_list_screen.dart';
import 'package:selparteknolojidna/app/ui/favourite_restaurant/favourite_restaurant_screen.dart';
import 'package:selparteknolojidna/app/ui/login_screen/get_started_screen.dart';
import 'package:selparteknolojidna/app/ui/my_order_list/my_order_list_screen.dart';
import 'package:selparteknolojidna/app/ui/notification/notification_screen.dart';
import 'package:selparteknolojidna/app/ui/profile_screen/edit_profile_screen.dart';
import 'package:selparteknolojidna/app/ui/them_change_screen/them_change_screen.dart';

import '../../../constant/constant.dart';
import '../../../controller/profile_controller.dart';
import '../../../services/preferences.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/network_image_widget.dart';
import '../language_screen/language_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: controller.isLoading.value
                ? Constant.loader()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Profilim".tr,
                            textAlign: TextAlign.start,
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
                            "Kişisel bilgileriniz".tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              height: 1.2,
                              color: AppThemData.assetColorLightGrey1000,
                              fontSize: 14,
                              fontFamily: AppThemData.regular,
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 56,
                                width: 56,
                                child: ClipOval(
                                  child: Image.network(
                                      "api"+Preferences.pref.getString("FirmaLogo").toString(),
                                    ),
                                  ),

                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Preferences.pref.getString("adi").toString()+" "+Preferences.pref.getString("soyad").toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                        fontSize: 16,
                                        fontFamily: AppThemData.semiBold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      Preferences.pref.getString("uid").toString(),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                        fontSize: 12,
                                        fontFamily: AppThemData.regular,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(const EditProfileScreen(), transition: Transition.rightToLeftWithFade);
                                },
                                child: const Text(
                                  "Düzenle",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: AppThemData.foodAppOrange600,
                                    fontSize: 16,
                                    fontFamily: AppThemData.medium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const FavouriteRestaurantScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "My Favourite Restaurants", description: "Manage your favourite restaurants.", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const AddressListScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "Addresses", description: "Share, edit and add a new Address.", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const MyOrderListScreen(isActionBarShow: true), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "Orders", description: "Manage your ongoing and past orders.", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const NotificationScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "Settings", description: "Set the all notifications", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const AboutScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "About", description: "Know more about the service and policy.", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const ThemChangeScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "Them", description: "Change your app theme", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Get.to(const LanguageScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "Language", description: "Select your preferable language", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                Preferences.setBoolean(Preferences.isLogin, false);
                                Get.offAll(const GetStatedScreen(),transition: Transition.rightToLeftWithFade);
                              },
                              child: profileView(title: "Log Out", description: "You can also a log out to the device.", themeChange: themeChange)),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider(
                              color: AppThemData.assetColorGrey300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget profileView({required String title, required String description, themeChange}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                  fontSize: 16,
                  fontFamily: AppThemData.semiBold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                description.tr,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                  fontSize: 12,
                  fontFamily: AppThemData.regular,
                ),
              ),
            ],
          ),
        ),
        SvgPicture.asset("assets/icons/ic_right_food.svg"),
      ],
    );
  }
}
