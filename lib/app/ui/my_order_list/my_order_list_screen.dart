import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../controller/my_order_list_controller.dart';
import '../../../model/my_order_list_model.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/round_button_fill.dart';
import '../order_details/order_details_screen.dart';
import '../rate_meal_screen/rate_meal_screen.dart';
import '../track_order_screen/track_order_screen.dart';

class MyOrderListScreen extends StatelessWidget {
  final bool isActionBarShow;

  const MyOrderListScreen({super.key, required this.isActionBarShow});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: MyOrderListController(),
        builder: (controller) {
          return Scaffold(
            appBar: isActionBarShow
                ? CommonUI.customAppBar(context,
                    title: Text(
                      "My Orders",
                      style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                    ),
                    isBack: true)
                : null,
            body: controller.isLoading.value
                ? Constant.loader()
                : SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "My Orders".tr,
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
                                  "View the details and status of your past and current orders.".tr,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    height: 1.2,
                                    color: AppThemData.assetColorLightGrey1000,
                                    fontSize: 14,
                                    fontFamily: AppThemData.regular,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: controller.myOrderListModel.value.orderList!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                OrderList orderList = controller.myOrderListModel.value.orderList![index];
                                return InkWell(
                                  onTap: () {
                                    Get.to(const OrderDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    orderList.name.toString(),
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                                      fontSize: 14,
                                                      fontFamily: AppThemData.semiBold,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      orderList.status == "In Progress"
                                                          ? "assets/icons/ic_alaram_food.svg"
                                                          : orderList.status == "Refunded"
                                                              ? "assets/icons/refunded_food.svg"
                                                              : "assets/icons/delivered_food.svg",
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      orderList.status.toString(),
                                                      textAlign: TextAlign.start,
                                                      style: TextStyle(
                                                        color: orderList.status == "In Progress"
                                                            ? AppThemData.semanticColorWarning07
                                                            : orderList.status == "Refunded"
                                                                ? AppThemData.foodAppOrange600
                                                                : AppThemData.semanticColorSuccess07,
                                                        fontSize: 12,
                                                        fontFamily: AppThemData.bold,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              orderList.address.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 12,
                                                fontFamily: AppThemData.regular,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${Constant.currency} ${orderList.amount.toString()}",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                                fontSize: 14,
                                                fontFamily: AppThemData.medium,
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.symmetric(vertical: 5),
                                              child: Divider(),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  orderList.item.toString(),
                                                  textAlign: TextAlign.start,
                                                  style: const TextStyle(
                                                    color: AppThemData.assetColorLightGrey1000,
                                                    fontSize: 12,
                                                    fontFamily: AppThemData.regular,
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.chevron_right,
                                                  color: AppThemData.assetColorLightGrey1000,
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              orderList.dateTime.toString(),
                                              textAlign: TextAlign.start,
                                              style: const TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 12,
                                                fontFamily: AppThemData.regular,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            orderList.status == "In Progress"
                                                ? Row(
                                                    children: [
                                                      Expanded(
                                                        child: RoundedButtonFill(
                                                          title: "Cancel".tr,
                                                          color: themeChange.getThem()?AppThemData.assetColorGrey700:AppThemData.assetColorGrey100,
                                                          textColor: themeChange.getThem()?AppThemData.white:AppThemData.assetColorGrey600,
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
                                                          title: "Track Order".tr,
                                                          color: AppThemData.foodAppOrange600,
                                                          textColor: AppThemData.white,
                                                          fontFamily: AppThemData.bold,
                                                          onPress: () {
                                                            Get.to(const TrackOrderScreen(), transition: Transition.rightToLeftWithFade);
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    children: [
                                                      Expanded(
                                                        child: RoundedButtonFill(
                                                          title: "REORDER".tr,
                                                          color: themeChange.getThem()?AppThemData.assetColorGrey700:AppThemData.assetColorGrey100,
                                                          textColor: themeChange.getThem()?AppThemData.white:AppThemData.assetColorGrey600,
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
                                                  ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
