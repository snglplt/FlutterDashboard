import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/address_screen/add_address_screen.dart';
import 'package:selparteknolojidna/controller/address_controller.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class MapLocationPickScreen extends StatelessWidget {
  const MapLocationPickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetBuilder(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Confirm Delivery Address",
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
                        markers: Set<Marker>.of(controller.markers.values),
                        onMapCreated: (GoogleMapController controller1) {
                          controller.mapController.complete(controller1);
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/ic_location_food.svg"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Triplicane",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                          fontSize: 16,
                                          fontFamily: AppThemData.semiBold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 05,
                                      ),
                                      Text(
                                        "8502 Preston Rd. Inglewood, Maine 98380",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                          fontSize: 14,
                                          fontFamily: AppThemData.medium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            RoundedButtonFill(
                              title: "Enter Complete Address".tr,
                              color: AppThemData.foodAppOrange600,
                              textColor: AppThemData.white,
                              isRight: false,
                              onPress: () {
                                Get.off(const AddAddressScreen(),transition: Transition.rightToLeftWithFade);
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                        fontSize: 16, color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontWeight: FontWeight.w500, fontFamily: AppThemData.medium),
                    decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.red),
                        isDense: true,
                        filled: true,
                        enabled: true,
                        fillColor: AppThemData.white,
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset("assets/icons/ic_search_food.svg"),
                        ),
                        disabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: AppThemData.foodAppOrange600)),
                        enabledBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: Colors.white)),
                        errorBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)), borderSide: BorderSide(color: Colors.white)),
                        hintText: "Search area, street name.... ".tr,
                        hintStyle: const TextStyle(fontSize: 14, color: AppThemData.darkGreyLight, fontWeight: FontWeight.w500, fontFamily: AppThemData.medium)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
