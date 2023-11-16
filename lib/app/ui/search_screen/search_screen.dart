import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/home_screen/home_screen.dart';
import 'package:selparteknolojidna/app/ui/restaurant_list/restaurant_list_screen.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/search_screen_controller.dart';
import 'package:selparteknolojidna/model/category_model.dart';
import 'package:selparteknolojidna/model/search_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/them/responsive.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetX(
      init: SearchScreenController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: themeChange.getThem() ? AppThemData.assetColorGrey1000 : AppThemData.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: SizedBox(
              width: Responsive.width(100, context),
              height: Responsive.height(6, context),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.sentences,
                controller: controller.searchTextFiledController.value,
                textAlign: TextAlign.start,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                style:
                    TextStyle(fontSize: 16, color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontWeight: FontWeight.w500, fontFamily: AppThemData.medium),
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.red),
                  isDense: true,
                  filled: true,
                  enabled: true,
                  fillColor: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.searchTextFiledController.value.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset("assets/icons/ic_close_food.svg"),
                    ),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset("assets/icons/ic_search_food.svg"),
                  ),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
                  focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: AppThemData.foodAppOrange600)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
                  errorBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
                  border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : Colors.white)),
                  hintText: "Search Food, Restaurant, Dish.... ",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    color: themeChange.getThem() ? AppThemData.assetColorLightGrey900 : AppThemData.assetColorLightGrey900,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppThemData.medium,
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: controller.isLoading.value
                ? Constant.loader()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Categories".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                fontSize: 18,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                            SizedBox(
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Search History".tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                fontSize: 18,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                            Text(
                              "Clear all".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppThemData.foodAppOrange600,
                                fontSize: 14,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchModel.value.searchHistory!.length,
                          itemBuilder: (context, index) {
                            SearchHistory searchHistoryModel = controller.searchModel.value.searchHistory![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/ic_search_food.svg"),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: Text(
                                      searchHistoryModel.searchName.toString(),
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                        color: AppThemData.assetColorLightGrey900,
                                        fontSize: 16,
                                        fontFamily: AppThemData.semiBold,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset("assets/icons/ic_close_food.svg")
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
