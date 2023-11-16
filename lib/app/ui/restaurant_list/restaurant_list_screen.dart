import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../controller/restaurant_list_controller.dart';
import '../../../model/restaurant_model.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/text_field_widget.dart';
import '../home_screen/home_screen.dart';
import '../restaurant_details/restaurant_details_screen.dart';

class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetX<RestaurantListController>(
        init: RestaurantListController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context),
            body: controller.isLoading.value
                ? Constant.loader()
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
                            "Discover Nearby Restaurants".tr,
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
                            "Explore a wide selection of restaurants in your area offering a variety of cuisines and dining experiences.".tr,
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
                          TextFieldWidget(
                            controller: null,
                            hintText: "Search Food, Restaurant, Dish.... ",
                            enable: false,
                            prefix: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset("assets/icons/ic_search_home_food.svg", height: 22, width: 22),
                            ),
                          ),
                          controller.restaurantModel.value.restaurants!.isEmpty
                              ? Constant.emptyView(text: "No Data Found", description: " 😕 Sorry, there's nothing to display here at the moment. Let's find something amazing!")
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.restaurantModel.value.restaurants!.length,
                                  itemBuilder: (context, index) {
                                    RestaurantModel restaurantNearNy = controller.restaurantModel.value.restaurants![index];
                                    return InkWell(
                                      onTap: () {
                                        Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                      },
                                      child: RestaurantWidget(
                                        restaurantNearNy: restaurantNearNy,
                                      ),
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
