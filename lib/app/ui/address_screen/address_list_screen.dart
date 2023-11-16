import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/address_screen/map_location_pick_screen.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/address_controller.dart';
import 'package:selparteknolojidna/model/address_list_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';

class AddressListScreen extends StatelessWidget {
  const AddressListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: AddressController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Address",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : controller.addressModel.value.addressList!.isEmpty
                    ? Container()
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(const MapLocationPickScreen(), transition: Transition.rightToLeftWithFade);
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(14)),
                                  child: Container(
                                    color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: AppThemData.foodAppOrange600,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Add Address",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppThemData.foodAppOrange600,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.chevron_right,
                                            color: AppThemData.assetColorGrey400,
                                          )
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
                                "Saved Address",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppThemData.assetColorLightGrey1000,
                                  fontSize: 14,
                                  fontFamily: AppThemData.medium,
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.addressModel.value.addressList!.length,
                                itemBuilder: (context, index) {
                                  AddressList addressModel = controller.addressModel.value.addressList![index];
                                  return AddressListWidget(
                                    addressList: addressModel,
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
          );
        });
  }
}

class AddressListWidget extends StatelessWidget {
  final AddressList addressList;

  const AddressListWidget({super.key, required this.addressList});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        child: Container(
          color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/ic_location_view_food.svg"),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        addressList.saveAs!.toUpperCase(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                          fontSize: 14,
                          fontFamily: AppThemData.medium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${addressList.address!} ${addressList.area!} ${addressList.landmark!}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                          fontSize: 14,
                          fontFamily: AppThemData.semiBold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                PopupMenuButton(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppThemData.assetColorGrey400,
                  ),
                  color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorLightGrey1000),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'Delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete_outline, color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorLightGrey1000),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Delete',
                              style: TextStyle(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorLightGrey1000,
                                fontSize: 16,
                                fontFamily: AppThemData.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  onSelected: (String value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
