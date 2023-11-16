import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/acil_destek.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/arac_gecmisi.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/arac_kiralama.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/aracim_arizandi.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/aracim_ne_asamada.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/cam_kirildi.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/diyalog.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/firsatlar_dunyasi.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/hatirlatici.dart';
import 'package:selparteknolojidna/app/ui/car_demage_screen/sigorta_yaptiracagim.dart';
import 'package:selparteknolojidna/app/ui/favorite_screen/favori_listem.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageGrid(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ImageGrid extends StatelessWidget {
  final List<Map<String, String>> imageUrls = [
    {'path': 'assets/img/location.png', 'text': 'En Yakın Servis Noktamız'},
    {'path': 'assets/img/fırsatlar_sepeti2.png', 'text': 'Fırsatlar Dünyası'},
    {'path': 'assets/img/aracım_ne_asamada2.png', 'text': 'Aracım Ne Aşamada'},
    {'path': 'assets/img/hatirlatici.png', 'text': 'Hatırlatıcı'},
    {'path': 'assets/img/acil_destek.png', 'text': 'Acil Destek'},
    {'path': 'assets/img/aracınızı_sımartın.png', 'text': 'Aracınızı Şımartın'},
    {'path': 'assets/img/megafon.png', 'text': 'Duyurular'},
    {'path': 'assets/img/diyalog.png', 'text': 'Diyalog'},
    {'path': 'assets/img/randevu.png', 'text': 'Randevu Al'},
  ];
  final List<StatefulWidget> PageData = [
    AracForm(),
    FirsatlarForm(),
    AracimNeAsamadaForm(),
    HatirlaticiForm(),
    AcilDestekForm(),
    AracGecmisiForm(),
    FavoriForm(),
    CamForm(),
    SigortaForm(),
    DiyalogForm(),
    AracKiralamaForm()
  ];

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Center(
      child: Scaffold(
        appBar: CommonUI.customAppBar(context,
            title: Center(
              child: Text(
                'Otolent Asistanı'.tr,
                style: TextStyle(
                    color: themeChange.getThem()
                        ? AppThemData.assetColorGrey100
                        : AppThemData.assetColorGrey600,
                    fontFamily: AppThemData.semiBold,
                    fontSize: 16),
              ),
            ),
            isBack: false),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          children: List.generate(9, (index) {
            return Center(
              child: GridTile(
                child: Container(
                  width: double.maxFinite,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: InkWell(
                      // Wrap in InkWell for tap functionality
                      onTap: () {
                        // Card'a tıklandığında yeni sayfaya geçiş yap
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PageData[index]),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            imageUrls[index]['path']!,
                            width: 60.0, // Adjust the width based on your needs
                            height: 50.0,
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            imageUrls[index]['text']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.0, // Set your desired text size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }


}
