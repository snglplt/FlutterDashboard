import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/model/add_on_model.dart';
import 'package:selparteknolojidna/model/featured_item_model.dart';
import 'package:selparteknolojidna/model/menu_model.dart';
import 'package:selparteknolojidna/model/product_model.dart';
import 'package:selparteknolojidna/model/restaurant_details_model.dart';

class RestaurantDetailsController extends GetxController {

  var selectedPageIndex = 0.obs;

  bool get isLastPage => selectedPageIndex.value == imageList.length - 1;
  var pageController = PageController(initialPage: 0,viewportFraction: 0.90);

  RxList<String> imageList = <String>[].obs;


  Rx<RestaurantDetailsModel> restaurantDetailsModel = RestaurantDetailsModel().obs;
  Rx<FeaturedItemModel> featuredItemModel = FeaturedItemModel().obs;
  Rx<ProductModel> productModel = ProductModel().obs;
  Rx<MenuModel> menuModel = MenuModel().obs;
  Rx<AddOnModel> addonModel = AddOnModel().obs;
  RxBool isLoading = true.obs;

  RxList filterList = ['Pure Veg.', 'Best Seller', 'Newest'].obs;

  RxString selectedFilterList = 'Pure Veg.'.obs;

  RxString addOnQuantity = "".obs;

  void changeAddOnQuantity(String? value) {
    addOnQuantity.value = value!;
  }

  RxString addOnChoice = "".obs;

  void changeAddOnChoice(String? value) {
    addOnChoice.value = value!;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.restaurantDetailsJson).then((value) {
      restaurantDetailsModel.value = RestaurantDetailsModel.fromJson(value);
    });
    await Constant.loadJson(path: Constant.productJson).then((value) {
      productModel.value = ProductModel.fromJson(value);
    });
    await Constant.loadJson(path: Constant.featuredJson).then((value) {
      featuredItemModel.value = FeaturedItemModel.fromJson(value);
    });
    await Constant.loadJson(path: Constant.productJson).then((value) {
      productModel.value = ProductModel.fromJson(value);
    });
    await Constant.loadJson(path: Constant.menuJson).then((value) {
      menuModel.value = MenuModel.fromJson(value);
    });
    await Constant.loadJson(path: Constant.addOnJson).then((value) {
      addonModel.value = AddOnModel.fromJson(value);
    });
    imageList.add("https://images.pexels.com/photos/7441761/pexels-photo-7441761.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    imageList.add("https://images.pexels.com/photos/10897655/pexels-photo-10897655.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    imageList.add("https://images.pexels.com/photos/8969237/pexels-photo-8969237.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    imageList.add("https://images.pexels.com/photos/15564188/pexels-photo-15564188/free-photo-of-pancakes-with-berries-and-marple-syrup.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
    isLoading.value = false;
  }
}
