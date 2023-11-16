import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'dart:io';

import 'package:selparteknolojidna/widgets/common_ui.dart';

class CamForm extends StatefulWidget {
  @override
  CamKirildi createState() => CamKirildi();
}

class CamKirildi extends State<CamForm> {
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
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Cam Kırıldı'.tr,
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
        body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        // İlk resim
                        Image.network(
                          'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg',
                          width: 100.0, // Width
                          height: 80.0, // Height
                        ), // ), // İlk resmin yolunu belirtin

                        // İkinci resim
                        SizedBox(width: 10.0),
                        Image.network(
                          'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg',

                          width: 100.0, // Width
                          height: 80.0,
                        ),
                        // İkinci resmin yolunu belirtin
                      ],
                    ),


                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: image1 == null
                              ? ElevatedButton(
                            onPressed: () {
                              _getImage(1);
                            },
                            child: Text('Değiştir'),
                          )
                              : Image.file(image1),
                        ),
                        SizedBox(width: 15.0),
                        Expanded(
                          child: image2 == null
                              ? ElevatedButton(
                            onPressed: () {
                              _getImage(2);
                            },
                            child: Text('Tamir Ettir '),
                          )
                              : Image.file(image2),
                        ),

                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text('Cam Ön'),
                    SizedBox(height: 5.0),
                    TextFormField(
                      controller: textInfoController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        filled: true, // Fill the background with the color
                        fillColor: Colors.grey,
                      ),

                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // İlk butonun tıklama işlemi
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Arka plan rengini belirle
                      ),
                      child: Text('Resim Çek'),
                    ),
                    SizedBox(height: 20.0),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                          margin: EdgeInsets.all(10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceAround, // İki butonu eşit aralıklarla hizala
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    // İlk butonun tıklama işlemi
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Arka plan rengini belirle
                                  ),
                                  child: Text('En Yakın Camcı'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // İkinci butonun tıklama işlemi
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red), // Arka plan rengini belirle
                                  ),
                                  child: Text('Servise Gönder'),
                                ),
                              ])),
                    ),
                  ]),
            )));
  }
}
