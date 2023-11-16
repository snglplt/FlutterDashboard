import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/services/preferences.dart';

import '../../../constant/constant.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../controller/home_controller.dart';
import '../../../model/banner_model.dart';
import '../../../model/category_model.dart';
import '../../../model/home_model.dart';
import '../../../model/restaurant_model.dart';
import '../../../them/app_them_data.dart';
import '../../../them/responsive.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/network_image_widget.dart';
import '../../../widgets/round_button_fill.dart';
import '../../../widgets/text_field_widget.dart';
import '../notification/notification_screen.dart';
import '../restaurant_details/restaurant_details_screen.dart';
import '../restaurant_list/restaurant_list_screen.dart';

class HomeScreen extends StatelessWidget {
  final RxString ad;
  final RxString username;
  final RxString uid;
  const HomeScreen({required this.ad,required this.username,required this.uid, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DashBoardController dataController = Get.put(DashBoardController());
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetX(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: themeChange.getThem() ? AppThemData.assetColorGrey1000 : AppThemData.white,
              elevation: 0,
              title: Row(
                children: [
                  SizedBox(
                    height: 38,
                    width: 38,
                    child: ClipOval(
                      child: Image.network(
                        "api"+Preferences.pref.getString("FirmaLogo").toString(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Selpar Mobile'a Hoşgeldin "+Preferences.pref.getString("adi").toString(),
                            //"Selpar DNA'ya Hoşgeldin ${dataController.myData.value.obs}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppThemData.assetColorGrey400,
                              fontSize: 12,
                              height: 0.14,
                              fontFamily: AppThemData.semiBold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                    ],
                  ),
                ],
              ),
              actions: [
                InkWell(
                  onTap: () {
                    Get.to(const NotificationScreen(), transition: Transition.rightToLeftWithFade);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset("assets/icons/ic_settings_food.svg"),
                  ),
                )
              ],
            ),
            body: controller.isLoading.value
                ? Constant.loader()
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: InkWell(
                              onTap: () {
                                DashBoardController dashBoardController = Get.find<DashBoardController>();
                                dashBoardController.selectedIndex.value = 2;

                                // Get.to(const SearchScreen());
                              },
                              child: TextFieldWidget(
                                controller: null,
                                hintText: "Plaka giriniz... ",
                                obscureText: true,
                                enable: false,
                                prefix: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset("assets/icons/ic_search_home_food.svg", height: 22, width: 22),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Responsive.height(25, context),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Responsive.height(22, context),
                                  child: PageView.builder(
                                      padEnds: false,
                                      itemCount: controller.bannerModel.value.banner!.length,
                                      scrollDirection: Axis.horizontal,
                                      onPageChanged: controller.selectedPageIndex,
                                      controller: controller.pageController,
                                      itemBuilder: (context, index) => BannerWidget(
                                            banners: controller.bannerModel.value.banner![index],
                                          )),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      controller.bannerModel.value.banner!.length,
                                      (index) => Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 4),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: controller.selectedPageIndex.value == index ? AppThemData.foodAppOrange600 : AppThemData.foodAppOrange400,
                                            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: SizedBox(
                              height: Responsive.height(13, context),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.categoryModel.value.category!.length,
                                itemBuilder: (context, index) {
                                  Category category = controller.categoryModel.value.category![index];
                                  return InkWell(
                                    onTap: () {
                                      Get.to(const RestaurantListScreen(), transition: Transition.rightToLeftWithFade);
                                    },
                                    child: CategoryWidget(
                                      category: category,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Meals of the day".tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                    fontSize: 18,
                                    fontFamily: AppThemData.semiBold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Get the best meals to start your day".tr,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: AppThemData.assetColorLightGrey1000,
                                    fontSize: 14,
                                    fontFamily: AppThemData.medium,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                SizedBox(
                                  height: Responsive.height(27, context),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: controller.homeModel.value.mealsOfTheDay!.length,
                                    itemBuilder: (context, index) {
                                      MealsOfTheDay mealOfTheDay = controller.homeModel.value.mealsOfTheDay![index];
                                      return InkWell(
                                        onTap: () {
                                          Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                        },
                                        child: SizedBox(
                                          width: Responsive.width(44, context),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                                              child: Stack(
                                                children: [
                                                  NetworkImageWidget(
                                                    height: Responsive.height(100, context),
                                                    width: Responsive.height(100, context),
                                                    imageUrl: mealOfTheDay.image.toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Container(
                                                    height: Responsive.height(100, context),
                                                    width: Responsive.height(100, context),
                                                    color: Colors.black.withOpacity(0.40),
                                                  ),
                                                  Positioned(
                                                    top: 10,
                                                    right: 10,
                                                    child: SvgPicture.asset("assets/icons/ic_like_food.svg"),
                                                  ),
                                                  Positioned(
                                                    bottom: 10,
                                                    left: 10,
                                                    right: 10,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          mealOfTheDay.name.toString(),
                                                          textAlign: TextAlign.center,
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                            color: AppThemData.assetColorLightGrey600,
                                                            fontSize: 18,
                                                            overflow: TextOverflow.ellipsis,
                                                            fontFamily: AppThemData.bold,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset("assets/icons/ic_clock_food.svg"),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    mealOfTheDay.time.toString(),
                                                                    textAlign: TextAlign.center,
                                                                    maxLines: 1,
                                                                    style: const TextStyle(
                                                                      color: AppThemData.assetColorGrey100,
                                                                      fontSize: 12,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      fontFamily: AppThemData.regular,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                children: [
                                                                  SvgPicture.asset("assets/icons/ic_star_food.svg"),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Text(
                                                                    mealOfTheDay.review.toString(),
                                                                    textAlign: TextAlign.center,
                                                                    maxLines: 1,
                                                                    style: const TextStyle(
                                                                      color: AppThemData.assetColorGrey100,
                                                                      fontSize: 12,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      fontFamily: AppThemData.regular,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.77, -0.63),
                                end: Alignment(-0.77, 0.63),
                                colors: [Color(0xFFFFF1EB), Color(0xFFF7F5CA)],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Popular for Breakfast".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: themeChange.getThem() ? AppThemData.assetColorGrey600 : AppThemData.assetColorGrey600,
                                      fontSize: 18,
                                      fontFamily: AppThemData.semiBold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "Start your day with the right mind".tr,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      color: AppThemData.assetColorLightGrey1000,
                                      fontSize: 14,
                                      fontFamily: AppThemData.medium,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: Responsive.height(27, context),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.homeModel.value.popularForBreakfast!.length,
                                      itemBuilder: (context, index) {
                                        PopularForBreakfast mealOfTheDay = controller.homeModel.value.popularForBreakfast![index];
                                        return InkWell(
                                          onTap: () {
                                            Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                          },
                                          child: SizedBox(
                                            width: Responsive.width(60, context),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 5),
                                              child: ClipRRect(
                                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                                child: Container(
                                                  color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: Stack(
                                                          children: [
                                                            NetworkImageWidget(
                                                              height: Responsive.height(100, context),
                                                              width: Responsive.height(100, context),
                                                              imageUrl: mealOfTheDay.image.toString(),
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Container(
                                                              height: Responsive.height(100, context),
                                                              width: Responsive.height(100, context),
                                                              color: Colors.black.withOpacity(0.40),
                                                            ),
                                                            Positioned(
                                                              top: 10,
                                                              right: 10,
                                                              child: SvgPicture.asset("assets/icons/ic_like_food.svg"),
                                                            ),
                                                            Positioned(
                                                              bottom: 10,
                                                              left: 10,
                                                              right: 10,
                                                              child: Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child: Row(
                                                                      children: [
                                                                        SvgPicture.asset("assets/icons/ic_clock_food.svg"),
                                                                        const SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                          mealOfTheDay.time.toString(),
                                                                          textAlign: TextAlign.center,
                                                                          maxLines: 1,
                                                                          style: const TextStyle(
                                                                            color: AppThemData.assetColorGrey100,
                                                                            fontSize: 12,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            fontFamily: AppThemData.regular,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child: Row(
                                                                      children: [
                                                                        SvgPicture.asset("assets/icons/ic_star_food.svg"),
                                                                        const SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                        Text(
                                                                          mealOfTheDay.review.toString(),
                                                                          textAlign: TextAlign.center,
                                                                          maxLines: 1,
                                                                          style: const TextStyle(
                                                                            color: AppThemData.assetColorGrey100,
                                                                            fontSize: 12,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            fontFamily: AppThemData.regular,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              mealOfTheDay.name.toString(),
                                                              textAlign: TextAlign.start,
                                                              style: TextStyle(
                                                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                                                fontSize: 16,
                                                                fontFamily: AppThemData.semiBold,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              height: 8,
                                                            ),
                                                            Text(
                                                              "${Constant.currency} ${mealOfTheDay.price.toString()}",
                                                              textAlign: TextAlign.start,
                                                              style: const TextStyle(
                                                                color: AppThemData.foodAppOrange600,
                                                                fontSize: 18,
                                                                fontFamily: AppThemData.bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Restaurants Nearby".tr,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                          fontSize: 18,
                                          fontFamily: AppThemData.semiBold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        "Best arounds you".tr,
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: AppThemData.assetColorLightGrey1000,
                                          fontSize: 14,
                                          fontFamily: AppThemData.medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(const RestaurantListScreen(), transition: Transition.rightToLeftWithFade);
                                  },
                                  child: Text(
                                    "View all".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppThemData.foodAppOrange600,
                                      fontSize: 18,
                                      fontFamily: AppThemData.semiBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.homeModel.value.restaurantNearBy!.length,
                              itemBuilder: (context, index) {
                                RestaurantModel restaurantNearNy = controller.homeModel.value.restaurantNearBy![index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                  },
                                  child: RestaurantWidget(
                                    restaurantNearNy: restaurantNearNy,
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}

class RestaurantWidget extends StatelessWidget {
  final RestaurantModel restaurantNearNy;

  const RestaurantWidget({super.key, required this.restaurantNearNy});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  NetworkImageWidget(
                    height: Responsive.height(16, context),
                    width: Responsive.height(14, context),
                    imageUrl: restaurantNearNy.image.toString(),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: Responsive.height(16, context),
                    width: Responsive.height(14, context),
                    color: Colors.black.withOpacity(0.40),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: SvgPicture.asset("assets/icons/ic_like_food.svg"),
                  ),
                  restaurantNearNy.discount!.isEmpty
                      ? Container()
                      : Positioned(
                          bottom: 10,
                          left: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "UPTO".tr,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: AppThemData.white,
                                  fontSize: 12,
                                  fontFamily: AppThemData.medium,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text("${restaurantNearNy.discount} Off".tr,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    color: AppThemData.white,
                                    fontSize: 18,
                                    fontFamily: AppThemData.bold,
                                  )),
                            ],
                          ),
                        )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurantNearNy.name.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                          fontSize: 18,
                          fontFamily: AppThemData.semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/ic_location_grey_food.svg"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            restaurantNearNy.name.toString(),
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppThemData.assetColorLightGrey900,
                              fontSize: 12,
                              fontFamily: AppThemData.semiBold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/ic_clock_food.svg"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                restaurantNearNy.time.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: AppThemData.assetColorLightGrey1000,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/ic_star_food.svg"),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                restaurantNearNy.review.toString(),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                style: const TextStyle(
                                  color: AppThemData.assetColorLightGrey1000,
                                  fontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 62,
            width: 62,
            child: ClipOval(
              child: NetworkImageWidget(imageUrl: category.image.toString(), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              category.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                fontSize: 14,
                fontFamily: AppThemData.semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  final Banners banners;

  const BannerWidget({super.key, required this.banners});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Stack(
              children: [
                NetworkImageWidget(
                  height: Responsive.height(100, context),
                  width: Responsive.height(100, context),
                  imageUrl: banners.image.toString(),
                  fit: BoxFit.cover,
                ),
                Container(
                  height: Responsive.height(100, context),
                  width: Responsive.height(100, context),
                  color: Colors.black.withOpacity(0.40),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "For all Restaurants",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppThemData.white,
                              fontSize: 12,
                              fontFamily: AppThemData.bold,
                            ),
                          ),
                          SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                color: AppThemData.assetColorLightGrey400,
                              )),
                          Text(
                            "T&C applied",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppThemData.white,
                              fontSize: 12,
                              fontFamily: AppThemData.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      RoundedButtonFill(
                        width: Responsive.width(5, context),
                        height: Responsive.width(1, context),
                        title: "Claim".tr,
                        color: AppThemData.foodAppOrange600,
                        textColor: AppThemData.white,
                        fontFamily: AppThemData.bold,
                        onPress: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoundedButtonFill(
                        width: Responsive.width(7, context),
                        height: Responsive.width(1, context),
                        title: "Limited Time".tr,
                        color: AppThemData.white,
                        textColor: AppThemData.foodAppOrange600,
                        fontFamily: AppThemData.bold,
                        onPress: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        banners.title!.tr,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          height: 1.2,
                          color: AppThemData.white,
                          fontSize: 20,
                          fontFamily: AppThemData.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
