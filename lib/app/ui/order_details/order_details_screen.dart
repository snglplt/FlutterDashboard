import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/my_separator.dart';
import '../../../widgets/round_button_fill.dart';
import '../rate_meal_screen/rate_meal_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: CommonUI.customAppBar(context,
          title: Text(
            "Order Detail",
            style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
          ),
          isBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(14)),
              child: Container(
                color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/ic_area_food.svg"),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Home",
                                style: TextStyle(color: AppThemData.assetColorLightGrey1000, fontFamily: AppThemData.regular, fontSize: 16),
                              ),
                              const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: AppThemData.assetColorLightGrey900,
                                  )),
                              Text(
                                "6391 Elgin St, Delaware 10299",
                                style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Text(
                                "The Oliv Tree Restro",
                                style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                              ),
                              const SizedBox(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: AppThemData.assetColorLightGrey900,
                                  )),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/icons/ic_clock_to_food.svg", colorFilter: const ColorFilter.mode(AppThemData.foodAppOrange600, BlendMode.srcIn)),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "32 Mins",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: AppThemData.foodAppOrange600,
                                      fontSize: 12,
                                      fontFamily: AppThemData.semiBold,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.check,
                color: AppThemData.semanticColorSuccess07,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order delivered on 12 Sep 2023, 01:41PM",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                        fontSize: 14,
                        fontFamily: AppThemData.medium,
                      ),
                    ),
                    Text(
                      "by Eleanor Pena",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                        fontSize: 14,
                        fontFamily: AppThemData.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Text(
            "Bill Details",
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              "Item Total",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "${Constant.currency} 120.00",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                              fontSize: 16,
                              fontFamily: AppThemData.semiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              "Delivery Cost",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "${Constant.currency}  5.00",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                              fontSize: 16,
                              fontFamily: AppThemData.semiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: MySeparator(color: AppThemData.assetColorGrey100),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              "Platform Fee",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "${Constant.currency} 1.14",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                              fontSize: 16,
                              fontFamily: AppThemData.semiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              "GST and Other Charges",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "${Constant.currency} 9.00",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                              fontSize: 16,
                              fontFamily: AppThemData.semiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: MySeparator(color: AppThemData.assetColorGrey100),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Total Pay",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "${Constant.currency} 135.14",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppThemData.foodAppOrange600,
                              fontSize: 18,
                              fontFamily: AppThemData.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Bill Details",
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              "Order Number",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "#123456",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                              fontSize: 16,
                              fontFamily: AppThemData.medium,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              "Payment Vie",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "Paid using upi",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppThemData.foodAppOrange600,
                              fontSize: 16,
                              fontFamily: AppThemData.semiBold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              "Phone Number",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.semiBold,
                              ),
                            ),
                          ),
                          Text(
                            "+91 12345 67890",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                              fontSize: 16,
                              fontFamily: AppThemData.medium,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                child: RoundedButtonFill(
                  title: "REORDER".tr,
                  color: AppThemData.assetColorGrey100,
                  textColor: AppThemData.assetColorGrey600,
                  fontFamily: AppThemData.bold,
                  onPress: () {},
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: RoundedButtonFill(
                  title: "RATE THE ORDER".tr,
                  color: AppThemData.foodAppOrange600,
                  textColor: AppThemData.white,
                  fontFamily: AppThemData.bold,
                  onPress: () {
                    Get.to(const RateMealScreen(), transition: Transition.rightToLeftWithFade);
                  },
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
