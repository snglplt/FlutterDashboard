import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/services/preferences.dart';

import '../../../controller/profile_controller.dart';
import '../../../them/app_them_data.dart';
import '../../../them/responsive.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/network_image_widget.dart';
import '../../../widgets/round_button_fill.dart';
import '../../../widgets/text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: ProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Profili Düzenle",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipOval(
                          child: Image.network(
                            "api"+Preferences.pref.getString("FirmaLogo").toString(),
                            width: 100,height: 100,
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                              "assets/icons/ic_edit_view_food.svg",
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldWidget(
                    controller: controller.fullTextFiledController.value,
                    hintText: "Enter Full Name",
                    title: "Full Name",
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("assets/icons/ic_user_food.svg", height: 22, width: 22),
                    ),
                  ),
                  TextFieldWidget(
                    controller: controller.emailTextFiledController.value,
                    hintText: "Enter Email Address",
                    title: "Email Address",
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("assets/icons/ic_email_food.svg", height: 22, width: 22),
                    ),
                  ),
                  TextFieldWidget(
                    controller: controller.emailTextFiledController.value,
                    hintText: "Enter Phone Number",
                    title: "Phone Number",
                    prefix: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset("assets/icons/ic_email_food.svg", height: 22, width: 22),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white, borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: "Male".tr,
                                  groupValue: controller.gender.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: controller.handleGenderChange,
                                ),
                                Text("Male".tr),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: "Female".tr,
                                  groupValue: controller.gender.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: controller.handleGenderChange,
                                ),
                                Text("Female".tr),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: "Other".tr,
                                  groupValue: controller.gender.value,
                                  activeColor: AppThemData.foodAppOrange600,
                                  onChanged: controller.handleGenderChange,
                                ),
                                Text("Other".tr),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  RoundedButtonFill(
                    title: "Değişiklikleri Kaydet".tr,
                    color: AppThemData.foodAppOrange600,
                    textColor: AppThemData.white,
                    fontFamily: AppThemData.bold,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}
