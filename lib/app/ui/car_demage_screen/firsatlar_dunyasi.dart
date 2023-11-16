import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'dart:io';

import 'package:selparteknolojidna/widgets/common_ui.dart';

class FirsatlarForm extends StatefulWidget {
  @override
  FirsatlarDunyasi createState() => FirsatlarDunyasi();
}

class FirsatlarDunyasi extends State<FirsatlarForm>  {
  final List<String> packageItems = [
    'Bakım Paketleri',
    'Yedek Parça',
    'Sahibinden Parça',
    'Kampanyalı Ürünler',
    'Fırsat Ürünleri',
    'Aksesuar',
    'Yağlar Sıvılar',
    'Parça Sorgula',
  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar:AppBar(
        title: Center(
          child: Text(
            'Fırsatlar Dünyası'.tr,
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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 sütun
        ),
        itemCount: packageItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Paket tıklandığında yapılacak işlemler
              print('Tıklanan Paket: ${packageItems[index]}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.deepOrangeAccent,
                child: Center(
                  child: Center(
                    child: Text(
                      packageItems[index],
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}