import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'dart:io';

import 'package:selparteknolojidna/widgets/common_ui.dart';

class AracimNeAsamadaForm extends StatefulWidget {
  @override
  AracimNeAsamada createState() => AracimNeAsamada();
}

class AracimNeAsamada extends State<AracimNeAsamadaForm> {
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
              'Servisteki Araçlar'.tr,
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
                        Text("Tarih"),
                        SizedBox(width: 5.0),
                        Text("Saat"),
                        SizedBox(width: 5.0),
                        Text("Yapılan İşlemler"),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    MyGridView()


                  ]),
            )));
  }
}
class MyGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('3 Sütun 10 Satır GridView'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Sütun sayısı
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: Container(
              color: Colors.blue, // Hücrenin arka plan rengi
              margin: EdgeInsets.all(4.0), // Hücreler arası boşluk
              child: Center(
                child: Text(
                  'Başlık $index',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        },
        itemCount: 30, // Toplam hücre sayısı (3 sütun x 10 satır = 30 hücre)
      ),
    );
  }
}