import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/language_controller.dart';
import 'package:selparteknolojidna/services/localization_service.dart';
import 'package:selparteknolojidna/services/preferences.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: LanguageController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Select Language",
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
                                controller.selectedLanguage.value = "English";
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "English",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppThemData.medium,
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                      ),
                                    ),
                                  ),
                                  Radio<String>(
                                    value: "English",
                                    groupValue: controller.selectedLanguage.value,
                                    activeColor: AppThemData.foodAppOrange600,
                                    onChanged: controller.handleLanguageChange,
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
                                controller.selectedLanguage.value = "Türkçe";
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Türkçe",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppThemData.medium,
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                      ),
                                    ),
                                  ),
                                  Radio<String>(
                                    value: "Türkçe",
                                    groupValue: controller.selectedLanguage.value,
                                    activeColor: AppThemData.foodAppOrange600,
                                    onChanged: controller.handleLanguageChange,
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
                                controller.selectedLanguage.value = "Arabic";
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Arabic",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: AppThemData.medium,
                                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                      ),
                                    ),
                                  ),
                                  Radio<String>(
                                    value: "Arabic",
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    groupValue: controller.selectedLanguage.value,
                                    activeColor: AppThemData.foodAppOrange600,
                                    onChanged: controller.handleLanguageChange,
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
                            if (controller.selectedLanguage.value == "English") {
                              LocalizationService().changeLocale("en");
                              Preferences.setString(Preferences.languageKey, "English");
                            }else if (controller.selectedLanguage.value == "Türkçe") {
                              LocalizationService().changeLocale("tr");
                              Preferences.setString(Preferences.languageKey, "Türkçe");
                            }
                            else {
                              LocalizationService().changeLocale("ar");
                              Preferences.setString(Preferences.languageKey, "Arabic");
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
