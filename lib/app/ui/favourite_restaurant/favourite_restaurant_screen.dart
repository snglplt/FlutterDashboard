import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/restaurant_details/restaurant_details_screen.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/favourite_restaurant_controller.dart';
import 'package:selparteknolojidna/model/restaurant_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/them/responsive.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/network_image_widget.dart';

class FavouriteRestaurantScreen extends StatelessWidget {
  const FavouriteRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: FavouriteRestaurantController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "My Favourite Restaurants",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : controller.restaurantModel.value.restaurants!.isEmpty
                    ? Container()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Favourites Dining Spots".tr,
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
                                "Discover and manage your cherished restaurants, where every meal is a delightful experience.".tr,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: AppThemData.assetColorLightGrey1000,
                                  fontSize: 14,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.restaurantModel.value.restaurants!.length,
                                itemBuilder: (context, index) {
                                  RestaurantModel restaurantNearNy = controller.restaurantModel.value.restaurants![index];
                                  return RestaurantFavouriteWidget(
                                    restaurantNearNy: restaurantNearNy,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
          );
        });
  }
}

class RestaurantFavouriteWidget extends StatelessWidget {
  final RestaurantModel restaurantNearNy;

  const RestaurantFavouriteWidget({super.key, required this.restaurantNearNy});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return InkWell(
      onTap: () {
        Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
      },
      child: Padding(
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
                      child: SvgPicture.asset("assets/icons/ic_like_fill_food.svg"),
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
      ),
    );
  }
}
