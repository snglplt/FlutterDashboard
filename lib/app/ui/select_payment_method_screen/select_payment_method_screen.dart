import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/track_order_screen/track_order_screen.dart';
import 'package:selparteknolojidna/controller/select_payment_controller.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class SelectPaymentMethodScreen extends StatelessWidget {
  const SelectPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: SelectPaymentController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Select Payment Method",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                const SizedBox(
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
                                          style:
                                              TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
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
                                          style:
                                              TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
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
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Recommended",
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
                                Image.asset("assets/images/ic_paytm.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Paytm UPI",
                                    style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.medium, fontSize: 16),
                                  ),
                                ),
                                Radio<String>(
                                  value: "Paytm".tr,
                                  groupValue: controller.paymentSelect.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: controller.handleGenderChange,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Payment Method",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(14)),
                        child: Container(
                          color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/ic_strip.png"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Stripe",
                                        style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.medium, fontSize: 16),
                                      ),
                                    ),
                                    Radio<String>(
                                      value: "Stripe".tr,
                                      groupValue: controller.paymentSelect.value,
                                      activeColor: AppThemData.foodAppOrange600,
                                      onChanged: controller.handleGenderChange,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/images/ic_google.png"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Google",
                                        style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.medium, fontSize: 16),
                                      ),
                                    ),
                                    Radio<String>(
                                      value: "Google".tr,
                                      groupValue: controller.paymentSelect.value,
                                      activeColor: AppThemData.foodAppOrange600,
                                      onChanged: controller.handleGenderChange,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/images/ic_paypal.png"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "PayPal",
                                        style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.medium, fontSize: 16),
                                      ),
                                    ),
                                    Radio<String>(
                                      value: "PayPal".tr,
                                      groupValue: controller.paymentSelect.value,
                                      activeColor: AppThemData.foodAppOrange600,
                                      onChanged: controller.handleGenderChange,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      "Recommended",
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
                                Image.asset("assets/images/ic_cash_food.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Cash on Delivery",
                                    style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.medium, fontSize: 16),
                                  ),
                                ),
                                Radio<String>(
                                  value: "Cod".tr,
                                  groupValue: controller.paymentSelect.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: controller.handleGenderChange,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                child: RoundedButtonFill(
                  title: "Make Payment".tr,
                  color: AppThemData.foodAppOrange600,
                  textColor: AppThemData.white,
                  fontFamily: AppThemData.bold,
                  onPress: () {
                    Get.to(const TrackOrderScreen(), transition: Transition.rightToLeftWithFade);
                  },
                ),
              ),
            ),
          );
        });
  }
}
