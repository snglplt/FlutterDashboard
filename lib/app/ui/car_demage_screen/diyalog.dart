import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/language_controller.dart';
import 'package:selparteknolojidna/services/localization_service.dart';
import 'package:selparteknolojidna/services/preferences.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'dart:io';

import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class DiyalogForm extends StatefulWidget {
  @override
  Diyalog createState() => Diyalog();
}

class Diyalog extends State<DiyalogForm> {
  final ImagePicker _imagePicker = ImagePicker();
  var image1, image2, image3;
  TextEditingController locationController = TextEditingController();
  TextEditingController textInfoController = TextEditingController();

  Future _getImage(int imageNumber) async {
    final pickedFile =
    await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      setState(() {
        if (imageNumber == 1) {
          image1 = imageFile;
        } else if (imageNumber == 2) {
          image2 = imageFile;
        } else if (imageNumber == 3) {
          image3 = imageFile;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: LanguageController(),
        builder: (controller) {
          return Scaffold(
            appBar:AppBar(
              title: Center(
                child: Text(
                  'Randevu Talebi'.tr,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppThemData.semiBold,
                      fontSize: 16),
                ),
              ),
              backgroundColor: themeChange.getThem()
                  ? AppThemData.assetColorGrey100
                  : AppThemData.assetColorGrey600,
              leading: IconButton(
                icon: Icon(Icons.arrow_back), // Geri ok ikonu
                onPressed: () {
                  // Geri gitme işlemi
                  Navigator.of(context).pop();
                },
              ),
            ),
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
                          controller.selectedLanguage.value = "Hasar Randevusu";
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Hasar Randevusu",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppThemData.medium,
                                  color: themeChange.getThem() ? AppThemData
                                      .assetColorGrey100 : AppThemData
                                      .assetColorGrey1000,
                                ),
                              ),
                            ),
                            Radio<String>(
                              value: "Hasar Randevusu",
                              groupValue: controller.selectedLanguage.value,
                              activeColor: AppThemData.foodAppOrange600,
                              onChanged: controller.handleLanguageChange,
                              materialTapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap,
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
                          controller.selectedLanguage.value = "Bakım Randevusu";
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Bakım Randevusu",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppThemData.medium,
                                  color: themeChange.getThem() ? AppThemData
                                      .assetColorGrey100 : AppThemData
                                      .assetColorGrey1000,
                                ),
                              ),
                            ),
                            Radio<String>(
                              value: "Bakım Randevusu",
                              groupValue: controller.selectedLanguage.value,
                              activeColor: AppThemData.foodAppOrange600,
                              onChanged: controller.handleLanguageChange,
                              materialTapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap,
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
                          controller.selectedLanguage.value = "Arıza Randevusu";
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Arıza Randevusu",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppThemData.medium,
                                  color: themeChange.getThem() ? AppThemData
                                      .assetColorGrey100 : AppThemData
                                      .assetColorGrey1000,
                                ),
                              ),
                            ),
                            Radio<String>(
                              value: "Arıza Randevusu",
                              groupValue: controller.selectedLanguage.value,
                              activeColor: AppThemData.foodAppOrange600,
                              onChanged: controller.handleLanguageChange,
                              materialTapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap,
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
                          controller.selectedLanguage.value = "Mini Onarım";
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Mini Onarım",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: AppThemData.medium,
                                  color: themeChange.getThem() ? AppThemData
                                      .assetColorGrey100 : AppThemData
                                      .assetColorGrey1000,
                                ),
                              ),
                            ),
                            Radio<String>(
                              value: "Mini Onarım",
                              materialTapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap,
                              groupValue: controller.selectedLanguage.value,
                              activeColor: AppThemData.foodAppOrange600,
                              onChanged: controller.handleLanguageChange,
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Text('Açıklama'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: textInfoController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true, // Fill the background with the color
                        fillColor: Colors.grey,
                      ),

                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: image1 == null
                            ? ElevatedButton(
                          onPressed: () {
                            _getImage(1);
                          },
                          child: Text('Foto Çek '),
                        )
                            : Image.file(image1),
                      ),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: image2 == null
                            ? ElevatedButton(
                          onPressed: () {
                            _getImage(2);
                          },
                          child: Text('Foto Galeri '),
                        )
                            : Image.file(image2),
                      ),
                    ],
                  ),
                  RoundedButtonFill(
                    title: "RANDEVU İSTE",
                    height: 5.5,
                    color: AppThemData.foodAppOrange600,
                    fontSizes: 16,
                    onPress: () {},
                  )
                ],
              ),
            ),
          );
        });
  }}