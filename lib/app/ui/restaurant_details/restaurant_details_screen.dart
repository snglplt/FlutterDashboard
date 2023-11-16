import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/cart_screen/cart_screen.dart';
import 'package:selparteknolojidna/app/ui/restaurant_list/restaurant_list_screen.dart';
import 'package:selparteknolojidna/app/ui/review_screen/review_screen.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/restaurant_details_controller.dart';
import 'package:selparteknolojidna/model/add_on_model.dart';
import 'package:selparteknolojidna/model/featured_item_model.dart';
import 'package:selparteknolojidna/model/menu_model.dart';
import 'package:selparteknolojidna/model/product_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/them/responsive.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/network_image_widget.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';
import 'package:selparteknolojidna/widgets/text_field_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class RestaurantDetailsScreen extends StatelessWidget {
  const RestaurantDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: RestaurantDetailsController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? Constant.loader()
                : Column(
                    children: [
                      Stack(
                        children: [
                          NetworkImageWidget(
                              height: Responsive.height(36, context), width: Responsive.width(100, context), imageUrl: controller.restaurantDetailsModel.value.image.toString(), fit: BoxFit.cover),
                          Container(
                            height: Responsive.height(36, context),
                            width: Responsive.width(100, context),
                            color: Colors.black.withOpacity(0.40),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: Responsive.height(6, context),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    SvgPicture.asset("assets/icons/ic_like_food.svg"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                RoundedButtonFill(
                                  width: Responsive.width(6, context),
                                  height: Responsive.width(1, context),
                                  title: "Open Now".tr,
                                  color: AppThemData.foodAppOrange600,
                                  textColor: AppThemData.white,
                                  fontFamily: AppThemData.bold,
                                  onPress: () {},
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.restaurantDetailsModel.value.name.toString(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: AppThemData.white,
                                          fontSize: 20,
                                          fontFamily: AppThemData.bold,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          final Uri launchUri = Uri(
                                            scheme: 'tel',
                                            path: "9876543210",
                                          );
                                          await launchUrl(launchUri);
                                        },
                                        child: SvgPicture.asset("assets/icons/ic_call_details_food.svg")),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () async {
                                          var uri = Uri.parse("google.navigation:q=23.0225,72.5714&mode=d");
                                          await launchUrl(uri);
                                        },
                                        child: SvgPicture.asset("assets/icons/ic_destination_food.svg")),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset("assets/icons/ic_location_grey_food.svg"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        controller.restaurantDetailsModel.value.address.toString(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          color: AppThemData.assetColorLightGrey700,
                                          fontSize: 12,
                                          fontFamily: AppThemData.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Divider(
                                    color: AppThemData.white,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(const ReviewScreen(), transition: Transition.rightToLeftWithFade);
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset("assets/icons/ic_star_food.svg", height: 20, width: 20),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  controller.restaurantDetailsModel.value.review.toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                    color: AppThemData.white,
                                                    fontSize: 16,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: AppThemData.semiBold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text(
                                            "134 Reviews",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: AppThemData.white,
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(height: 35, child: VerticalDivider(color: Colors.white)),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SvgPicture.asset("assets/icons/ic_bookmark_image_food.svg", height: 20, width: 20),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                controller.restaurantDetailsModel.value.bookmark.toString(),
                                                textAlign: TextAlign.center,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                  color: AppThemData.white,
                                                  fontSize: 16,
                                                  overflow: TextOverflow.ellipsis,
                                                  fontFamily: AppThemData.semiBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 6,
                                          ),
                                          const Text(
                                            "Bookmarks",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: AppThemData.white,
                                              fontSize: 12,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      child: SizedBox(height: 35, child: VerticalDivider(color: Colors.white)),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return imageDialog(controller);
                                              });
                                        },
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset("assets/icons/ic_picture_food.svg", height: 20, width: 20),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  controller.restaurantDetailsModel.value.images.toString(),
                                                  textAlign: TextAlign.center,
                                                  maxLines: 1,
                                                  style: const TextStyle(
                                                    color: AppThemData.white,
                                                    fontSize: 16,
                                                    overflow: TextOverflow.ellipsis,
                                                    fontFamily: AppThemData.semiBold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 6,
                                            ),
                                            const Text(
                                              "Images",
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: TextStyle(
                                                color: AppThemData.white,
                                                fontSize: 12,
                                                overflow: TextOverflow.ellipsis,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.77, -0.63),
                                    end: Alignment(-0.77, 0.63),
                                    colors: [Color(0xFFFDEFDA), Color(0xFFFDE7EA)],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "New! Try Pickup".tr,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: themeChange.getThem() ? AppThemData.assetColorGrey1000 : AppThemData.assetColorGrey1000,
                                                fontSize: 18,
                                                fontFamily: AppThemData.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Pickup on your time. Your Order is ready when you are.".tr,
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 14,
                                                fontFamily: AppThemData.regular,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      RoundedButtonFill(
                                        width: Responsive.width(6, context),
                                        height: Responsive.width(1, context),
                                        title: "Order Now".tr,
                                        color: AppThemData.foodAppOrange600,
                                        textColor: AppThemData.white,
                                        fontFamily: AppThemData.bold,
                                        onPress: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Featured Items".tr,
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
                                      height: Responsive.height(20, context),
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: controller.featuredItemModel.value.featuredItem!.length,
                                        itemBuilder: (context, index) {
                                          FeaturedItem mealOfTheDay = controller.featuredItemModel.value.featuredItem![index];
                                          return InkWell(
                                            onTap: () {
                                              Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                            },
                                            child: SizedBox(
                                              width: Responsive.width(67, context),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Explore Our Dishes".tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                        fontSize: 18,
                                        fontFamily: AppThemData.semiBold,
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
                                          fontSize: 14,
                                          fontFamily: AppThemData.semiBold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: InkWell(
                                  onTap: () {},
                                  child: TextFieldWidget(
                                    controller: null,
                                    hintText: "Search Food, Restaurant, Dish.... ",
                                    prefix: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset("assets/icons/ic_search_home_food.svg", height: 22, width: 22),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: Responsive.height(4.5, context),
                                child: ListView.builder(
                                  itemCount: controller.filterList.length,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Obx(
                                      () => InkWell(
                                        onTap: () {
                                          controller.selectedFilterList.value = controller.filterList[index].toString();
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: controller.selectedFilterList.value == controller.filterList[index].toString()
                                                    ? AppThemData.foodAppOrange600
                                                    : themeChange.getThem()
                                                        ? AppThemData.assetColorGrey800
                                                        : AppThemData.white,
                                                border: Border.all(
                                                  color: controller.selectedFilterList.value == controller.filterList[index].toString()
                                                      ? AppThemData.foodAppOrange600
                                                      : themeChange.getThem()
                                                          ? AppThemData.assetColorGrey800
                                                          : AppThemData.assetColorLightGrey700,
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(20))),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              child: Center(
                                                child: Text(
                                                  controller.filterList[index].toString(),
                                                  style: TextStyle(
                                                    fontFamily: AppThemData.medium,
                                                    fontSize: 14,
                                                    color: controller.selectedFilterList.value == controller.filterList[index].toString() ? Colors.white : AppThemData.assetColorLightGrey1000,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.productModel.value.productList!.length,
                                itemBuilder: (context, index) {
                                  ProductList productModel = controller.productModel.value.productList![index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    child: Theme(
                                      data: ThemeData().copyWith(
                                          dividerColor: Colors.transparent,
                                          unselectedWidgetColor: AppThemData.foodAppOrange600,
                                          colorScheme: const ColorScheme.light(
                                            primary: AppThemData.foodAppOrange600,
                                          )),
                                      child: ListTileTheme(
                                        contentPadding: const EdgeInsets.all(0),
                                        dense: true,
                                        horizontalTitleGap: 0.0,
                                        minLeadingWidth: 0,
                                        child: ExpansionTile(
                                          tilePadding: EdgeInsets.zero,
                                          childrenPadding: EdgeInsets.zero,
                                          initiallyExpanded: true,
                                          title: Text(
                                            productModel.name.toString(),
                                            style: TextStyle(
                                              fontFamily: AppThemData.semiBold,
                                              fontSize: 18,
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                            ),
                                          ),
                                          children: <Widget>[
                                            const Divider(),
                                            ListView.separated(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemCount: productModel.product!.length,
                                              itemBuilder: (context, index) {
                                                Product product = productModel.product![index];
                                                return InkWell(
                                                  onTap: () {
                                                    Get.to(const RestaurantDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                                  },
                                                  child: ProductWidget(
                                                    productModel: product,
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (context, index) {
                                                return const Divider();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                showGeneralDialog(
                  context: context,
                  barrierLabel: "Label",
                  barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0.5),
                  pageBuilder: (context, anim1, anim2) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: Responsive.height(10.5, context), left: 12, right: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              height: Responsive.height(40, context),
                              margin: EdgeInsets.only(bottom: Responsive.height(1.5, context), left: 12, right: 12),
                              decoration: BoxDecoration(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey1000 : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListView.builder(
                                itemCount: controller.menuModel.value.menuList!.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  MenuList menuList = controller.menuModel.value.menuList![index];
                                  return ExpansionTile(
                                      trailing: const Icon(Icons.add),
                                      title: Text(
                                        "${menuList.title.toString()} (${menuList.menu!.length})",
                                        style: TextStyle(
                                          fontFamily: AppThemData.medium,
                                          fontSize: 18,
                                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                        ),
                                      ),
                                      children: List.generate(
                                          menuList.menu!.length,
                                          (index) => ListTile(
                                              dense: true,
                                              visualDensity: const VisualDensity(vertical: -3),
                                              title: Text(menuList.menu![index],
                                                  style: TextStyle(
                                                    fontFamily: AppThemData.regular,
                                                    fontSize: 16,
                                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                                  )))));
                                },
                              ),
                            ),
                            FloatingActionButton.extended(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.close),
                              label: const Text('Close'),
                              backgroundColor: AppThemData.assetColorGrey600,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              icon: SvgPicture.asset("assets/icons/ic_menu_food.svg"),
              label: Text('Menu', style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.white, fontFamily: AppThemData.bold)),
              backgroundColor: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.assetColorGrey600,
            ),
            bottomNavigationBar: Container(
              color: AppThemData.foodAppOrange600,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "1 Item".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppThemData.white,
                                    fontSize: 18,
                                    fontFamily: AppThemData.regular,
                                  ),
                                ),
                                const SizedBox(height: 20, child: VerticalDivider(color: Colors.white)),
                                Text(
                                  "${Constant.currency} 249.86".tr,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: AppThemData.white,
                                    fontSize: 18,
                                    fontFamily: AppThemData.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Extra charges may apply".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppThemData.white,
                                fontSize: 14,
                                fontFamily: AppThemData.regular,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RoundedButtonFill(
                        width: 30,
                        height: 5,
                        title: "View Cart".tr,
                        color: AppThemData.white,
                        textColor: AppThemData.foodAppOrange600,
                        fontFamily: AppThemData.bold,
                        onPress: () {
                          Get.to(const CartScreen(), transition: Transition.rightToLeftWithFade);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget imageDialog(RestaurantDetailsController controller) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.imageList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: index == 0 ? 0 : 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: SizedBox(
                          width: Responsive.width(100, context),
                          height: Responsive.width(100, context),
                          child: NetworkImageWidget(imageUrl: controller.imageList[index], fit: BoxFit.cover),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      controller.pageController.animateToPage(controller.pageController.page!.toInt() - 1, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    },
                    child: SvgPicture.asset("assets/icons/ic_back_food.svg")),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                    onTap: () {
                      controller.pageController.animateToPage(controller.pageController.page!.toInt() + 1, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
                    },
                    child: SvgPicture.asset("assets/icons/ic_right_icon_food.svg"))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatefulWidget {
  final Product productModel;

  const ProductWidget({super.key, required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  RestaurantDetailsController restaurantDetailsController = Get.find<RestaurantDetailsController>();
  Rx<Product> product = Product().obs;

  @override
  void initState() {
    // TODO: implement initState
    product.value = widget.productModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productModel.name.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                    fontSize: 18,
                    height: 1.2,
                    fontFamily: AppThemData.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${Constant.currency}${widget.productModel.price}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                    fontSize: 18,
                    height: 1.0,
                    fontFamily: AppThemData.medium,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/ic_star_food.svg", height: 20, width: 20),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.productModel.review.toString(),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(
                        color: AppThemData.assetColorLightGrey1000,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: AppThemData.medium,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${widget.productModel.totalReview.toString()} Reviews",
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      style: const TextStyle(
                        color: AppThemData.assetColorLightGrey1000,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: AppThemData.regular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              showBottomSheet(context);
              product.value.quantity = (int.parse(product.value.quantity.toString()) + 1).toString();
            });
          },
          child: Container(
            height: Responsive.height(4, context),
            decoration: BoxDecoration(
                color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: AppThemData.foodAppOrange600)),
            child: Obx(
              () => Center(
                child: product.value.quantity == "0"
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppThemData.medium,
                            color: AppThemData.foodAppOrange600,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    product.value.quantity = (int.parse(product.value.quantity.toString()) - 1).toString();
                                  });
                                },
                                child: const Icon(Icons.remove, color: AppThemData.foodAppOrange600)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${product.value.quantity}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppThemData.medium,
                                color: AppThemData.foodAppOrange600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    product.value.quantity = (int.parse(product.value.quantity.toString()) + 1).toString();
                                  });
                                },
                                child: const Icon(Icons.add, color: AppThemData.foodAppOrange600)),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.45,
        maxChildSize: 0.85,
        expand: false,
        builder: (_, scrollController) => AddOnsBottomSheet(
          product: product.value,
        ),
      ),
    );
  }
}

class AddOnsBottomSheet extends StatefulWidget {
  final Product product;

  const AddOnsBottomSheet({super.key, required this.product});

  @override
  State<AddOnsBottomSheet> createState() => _AddOnsBottomSheetState();
}

class _AddOnsBottomSheetState extends State<AddOnsBottomSheet> {
  RestaurantDetailsController restaurantDetailsController = Get.find<RestaurantDetailsController>();
  Rx<Product> product = Product().obs;

  @override
  void initState() {
    // TODO: implement initState
    product.value = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Container(
        color: themeChange.getThem()?AppThemData.assetColorGrey800:AppThemData.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.name.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                              fontSize: 18,
                              height: 1.2,
                              fontFamily: AppThemData.semiBold,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${Constant.currency}${widget.product.price}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                              fontSize: 18,
                              height: 1.0,
                              fontFamily: AppThemData.medium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Divider(),
                ),
                const Text(
                  "Quantity",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppThemData.assetColorLightGrey1000,
                    fontSize: 14,
                    fontFamily: AppThemData.medium,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: Container(
                    color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: restaurantDetailsController.addonModel.value.addOnQuantity!.length,
                        itemBuilder: (context, index) {
                          AddOnQuantity addOnQuantity = restaurantDetailsController.addonModel.value.addOnQuantity![index];
                          return Obx(
                            () => Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  addOnQuantity.name.toString(),
                                  style: TextStyle(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorLightGrey1000,
                                    fontSize: 14,
                                    fontFamily: AppThemData.medium,
                                  ),
                                )),
                                Text(
                                  "${Constant.currency} ${addOnQuantity.price.toString()}",
                                  style: TextStyle(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                    fontSize: 14,
                                    fontFamily: AppThemData.medium,
                                  ),
                                ),
                                Radio<String>(
                                  value: addOnQuantity.name.toString(),
                                  groupValue: restaurantDetailsController.addOnQuantity.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: (value) {
                                    setState(() {
                                      restaurantDetailsController.changeAddOnQuantity(value);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Choice of Preparations (Optional)",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppThemData.assetColorLightGrey1000,
                    fontSize: 14,
                    fontFamily: AppThemData.medium,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                  child: Container(
                    color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: restaurantDetailsController.addonModel.value.addOnChoiceOfPreparations!.length,
                        itemBuilder: (context, index) {
                          AddOnQuantity addOnQuantity = restaurantDetailsController.addonModel.value.addOnChoiceOfPreparations![index];
                          return Obx(
                            () => Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  addOnQuantity.name.toString(),
                                  style: TextStyle(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorLightGrey1000,
                                    fontSize: 14,
                                    fontFamily: AppThemData.medium,
                                  ),
                                )),
                                Text(
                                  "${Constant.currency} ${addOnQuantity.price.toString()}",
                                  style: TextStyle(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                    fontSize: 14,
                                    fontFamily: AppThemData.medium,
                                  ),
                                ),
                                Radio<String>(
                                  value: addOnQuantity.name.toString(),
                                  groupValue: restaurantDetailsController.addOnChoice.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: (value) {
                                    setState(() {
                                      restaurantDetailsController.changeAddOnChoice(value);
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppThemData.foodAppOrange600,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: Responsive.height(5, context),
                  decoration: BoxDecoration(color: AppThemData.foodAppOrange600, borderRadius: const BorderRadius.all(Radius.circular(30)), border: Border.all(color: AppThemData.white)),
                  child: Center(
                    child: product.value.quantity == "0"
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Add",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: AppThemData.medium,
                                color: AppThemData.white,
                                fontSize: 14,
                              ),
                            ),
                          )
                        : Obx(
                            () => Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            product.value.quantity = (int.parse(product.value.quantity.toString()) - 1).toString();
                                          });
                                        },
                                        child: const Icon(Icons.remove, color: AppThemData.white)),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${product.value.quantity}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: AppThemData.medium,
                                      color: AppThemData.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            product.value.quantity = (int.parse(product.value.quantity.toString()) + 1).toString();
                                          });
                                        },
                                        child: const Icon(Icons.add, color: AppThemData.white)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                flex: 2,
                child: RoundedButtonFill(
                  height: 5,
                  title: "Add Item | \$20".tr,
                  color: AppThemData.white,
                  textColor: AppThemData.foodAppOrange600,
                  fontFamily: AppThemData.bold,
                  onPress: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
