import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/order_details/order_details_screen.dart';
import 'package:selparteknolojidna/controller/track_order_controller.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/network_image_widget.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetBuilder(
        init: TrackOrderController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Order Track",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: controller.kLake,
                        onMapCreated: (GoogleMapController controller1) {
                          controller.mapController.complete(controller1);
                        },
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Order No.",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppThemData.assetColorLightGrey1000,
                                            fontSize: 14,
                                            fontFamily: AppThemData.medium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "#123456",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                            fontSize: 18,
                                            fontFamily: AppThemData.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Est. Delivery time",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppThemData.assetColorLightGrey1000,
                                            fontSize: 14,
                                            fontFamily: AppThemData.medium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "32 Mins",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                            fontSize: 18,
                                            fontFamily: AppThemData.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Status",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppThemData.assetColorLightGrey1000,
                                            fontSize: 14,
                                            fontFamily: AppThemData.medium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "On the way",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                            fontSize: 18,
                                            fontFamily: AppThemData.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(),
                              ),
                              Row(
                                children: [
                                  const ClipOval(
                                      child: NetworkImageWidget(
                                    width: 52,
                                    height: 52,
                                    imageUrl:
                                        "https://images.unsplash.com/photo-1562159278-1253a58da141?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80",
                                    fit: BoxFit.cover,
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kristin Watson",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                            fontSize: 18,
                                            fontFamily: AppThemData.semiBold,
                                          ),
                                        ),
                                        const Text(
                                          "Your Rider",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: AppThemData.assetColorLightGrey1000,
                                            fontSize: 12,
                                            fontFamily: AppThemData.medium,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset("assets/icons/ic_call_icon_food.svg")
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Divider(),
                              ),
                              RoundedButtonFill(
                                title: "Order Details".tr,
                                color: AppThemData.foodAppOrange600,
                                textColor: AppThemData.white,
                                fontFamily: AppThemData.bold,
                                onPress: () {
                                  Get.to(const OrderDetailsScreen(), transition: Transition.rightToLeftWithFade);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(14)),
                    child: Container(
                      color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/ic_area_food.svg"),
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
                )
              ],
            ),
          );
        });
  }
}
