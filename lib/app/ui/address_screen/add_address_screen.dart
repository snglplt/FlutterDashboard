import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/address_controller.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/them/responsive.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';
import 'package:selparteknolojidna/widgets/text_field_widget.dart';

import '../../../utils/dark_theme_provider.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Enter Address Details",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Who are you ordering for?', style: TextStyle(fontFamily: AppThemData.medium, fontSize: 14, color: AppThemData.assetColorLightGrey1000)),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                              child: Row(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "My Self".tr,
                                        groupValue: controller.saveAs.value,
                                        activeColor: AppThemData.foodAppOrange600,
                                        onChanged: controller.handleGenderChange,
                                      ),
                                      Text("My Self".tr),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      Radio<String>(
                                        value: "Someone else".tr,
                                        groupValue: controller.saveAs.value,
                                        activeColor: AppThemData.foodAppOrange600,
                                        onChanged: controller.handleGenderChange,
                                      ),
                                      Text("Someone else".tr),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Save Address as*', style: TextStyle(fontFamily: AppThemData.medium, fontSize: 14, color: AppThemData.assetColorLightGrey1000)),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: Responsive.height(4.5, context),
                            child: ListView.builder(
                              itemCount: controller.saveAsList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      controller.selectedSaveAs.value = controller.saveAsList[index].toString();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: controller.selectedSaveAs.value == controller.saveAsList[index].toString()
                                                ? AppThemData.foodAppOrange600
                                                : themeChange.getThem()
                                                    ? AppThemData.assetColorGrey900
                                                    : AppThemData.white,
                                            border: Border.all(
                                              color: controller.selectedSaveAs.value == controller.saveAsList[index].toString()
                                                  ? AppThemData.foodAppOrange600
                                                  : themeChange.getThem()
                                                      ? AppThemData.assetColorGrey900
                                                      : AppThemData.assetColorLightGrey700,
                                            ),
                                            borderRadius: const BorderRadius.all(Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 30),
                                          child: Center(
                                            child: Text(
                                              controller.saveAsList[index].toString(),
                                              style: TextStyle(
                                                fontFamily: AppThemData.medium,
                                                fontSize: 14,
                                                color: controller.selectedSaveAs.value == controller.saveAsList[index].toString() ? Colors.white : AppThemData.assetColorLightGrey1000,
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
                          const SizedBox(
                            height: 20,
                          ),
                          controller.saveAs.value == "My Self"
                              ? Container()
                              : Column(
                                  children: [
                                    TextFieldWidget(
                                      controller: controller.addressTextFiledController.value,
                                      hintText: "Name",
                                      title: "Name",
                                      prefix: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset("assets/icons/ic_user_food.svg", height: 22, width: 22),
                                      ),
                                    ),
                                    TextFieldWidget(
                                      controller: controller.addressTextFiledController.value,
                                      hintText: "Phone Number",
                                      title: "Phone Number",
                                      prefix: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset("assets/icons/ic_call_food.svg", height: 22, width: 22),
                                      ),
                                    ),
                                  ],
                                ),
                          TextFieldWidget(
                            controller: controller.addressTextFiledController.value,
                            hintText: "Enter Flat / house no / floor / building",
                            title: "Address",
                          ),
                          TextFieldWidget(
                            controller: controller.areaTextFiledController.value,
                            hintText: "Enter area, sector, locality",
                            title: "Area, Sector, Locality*",
                          ),
                          TextFieldWidget(
                            controller: controller.landmarkTextFiledController.value,
                            hintText: "Nearby Landmark (Optional)",
                            title: "Landmark",
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          RoundedButtonFill(
                            title: "Save Details".tr,
                            color: AppThemData.foodAppOrange600,
                            textColor: AppThemData.white,
                            isRight: false,
                            onPress: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
