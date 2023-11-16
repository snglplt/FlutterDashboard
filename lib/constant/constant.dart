import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';

class Constant {
  static String homeJson = "assets/json/food_home_screen.json";
  static String categoryJson = "assets/json/food_category.json";
  static String userJson = "assets/json/user.json";
  static String bannerJson = "assets/json/food_banne.json";
  static String searchJson = "assets/json/food_search_history.json";
  static String restaurantJson = "assets/json/food_restaurant_list.json";
  static String addressListJson = "assets/json/food_address_list.json";
  static String productJson = "assets/json/food_product.json";
  static String cartJson = "assets/json/food_cart_product.json";
  static String featuredJson = "assets/json/food_featured_item.json";
  static String restaurantDetailsJson = "assets/json/food_restaurant_details.json";
  static String constantJson = "assets/json/food_coupon.json";
  static String orderJson = "assets/json/food_order_list.json";
  static String menuJson = "assets/json/food_menu_list.json";
  static String addOnJson = "assets/json/food_add_on.json";
  static String ratingJson = "assets/json/food_rating_list.json";

  static String currency = "\$";

  static Widget loader() {
    return const Center(
      child: CircularProgressIndicator(color: AppThemData.foodAppOrange600),
    );
  }

  static Widget emptyView({required String text, required String description}) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/ic_empty_view_food.svg"),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: const TextStyle(color: AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 24),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppThemData.assetColorLightGrey1000, fontFamily: AppThemData.medium, fontSize: 14),
          ),
        ],
      ),
    );
  }

  static Future<Map<String, dynamic>> loadJson({required String path}) async {
    String data = await rootBundle.loadString(path);
    return json.decode(data);
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
