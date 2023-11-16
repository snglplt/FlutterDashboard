import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/them_change_controller.dart';
import 'package:selparteknolojidna/services/preferences.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class ThemChangeScreen extends StatelessWidget {
  const ThemChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: ThemChangeController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Select Theme",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(children: [
                            InkWell(
                              onTap: () {
                                controller.lightDarkMode.value = "Light";
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Light",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppThemData.medium,
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                      ),
                                    ),
                                  ),
                                  Radio<String>(
                                    value: "Light",
                                    groupValue: controller.lightDarkMode.value,
                                    activeColor: AppThemData.foodAppOrange600,
                                    onChanged: controller.handleGenderChange,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Divider(
                                color: AppThemData.assetColorGrey300,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.lightDarkMode.value = "Dark";
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Dark",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppThemData.medium,
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                      ),
                                    ),
                                  ),
                                  Radio<String>(
                                    value: "Dark",
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    groupValue: controller.lightDarkMode.value,
                                    activeColor: AppThemData.foodAppOrange600,
                                    onChanged: controller.handleGenderChange,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                        RoundedButtonFill(
                          title: "Save",
                          height: 5.5,
                          color: AppThemData.foodAppOrange600,
                          fontSizes: 16,
                          onPress: () {
                            Preferences.setString(Preferences.themKey, controller.lightDarkMode.value);
                            if (controller.lightDarkMode.value == "Dark") {
                              themeChange.darkTheme = 0;
                            } else if (controller.lightDarkMode.value == "Light") {
                              themeChange.darkTheme = 1;
                            } else {
                              themeChange.darkTheme = 2;
                            }
                          },
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}
