import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_controller.dart';
import '../../../services/preferences.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/round_button_fill.dart';
import '../../../widgets/text_field_widget.dart';
import '../dash_board_screen/dash_board_screen.dart';
import '../forgot_password/forgot_password_screen.dart';
import '../signup_screen/signup_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetBuilder(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                isBack: false,
                backgroundColor: themeChange.getThem()
                    ? AppThemData.assetColorGrey1000
                    : AppThemData.assetColorLightGrey400),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Giriş Yapın!".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeChange.getThem()
                            ? AppThemData.assetColorGrey100
                            : AppThemData.assetColorGrey600,
                        fontSize: 24,
                        fontFamily: AppThemData.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Ayrıcalıklı tekliflerin tadını çıkarmaya devam etmek için hesabınıza giriş yapın.."
                          .tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        height: 1.2,
                        color: AppThemData.assetColorLightGrey1000,
                        fontSize: 14,
                        fontFamily: AppThemData.regular,
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),

                    TextFieldWidget(
                      controller: usernameController,
                      //controller: controller.emailTextFiledController.value,
                      hintText: "Kullanıcı Adı",
                      title: "Kullanıcı Adı",
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                            "assets/icons/ic_email_food.svg",
                            height: 22,
                            width: 22),
                      ),
                    ),
                    TextFieldWidget(
                      controller: passwordController,
                      //controller: controller.passwordTextFiledController.value,
                      hintText: "Şifre",
                      title: "Şifre",
                      obscureText: true,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                            "assets/icons/ic_password_food.svg",
                            height: 22,
                            width: 22),
                      ),
                    ),

                    const SizedBox(
                      height: 36,
                    ),
                    RoundedButtonFill(
                      title: "Giriş Yap".tr,
                      color: AppThemData.foodAppOrange600,
                      textColor: AppThemData.white,
                      fontFamily: AppThemData.bold,
                      onPress: () {
                        login(usernameController.text, passwordController.text);
                        bool isLogin = Preferences.getBoolean(Preferences.isLogin);
                        if(isLogin==true){
                          _showAlertDialogGirisYapti(context);

                        }else{
                          _showAlertDialogGirisYapmadi(context);
                        }

                        //Get.offAll(const DashBoardScreen(),transition: Transition.rightToLeftWithFade);
                      },
                    ),/*
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                  color: AppThemData.assetColorLightGrey700),
                            ),
                          ),
                          Text(
                            "OR".tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              height: 1.2,
                              color: AppThemData.assetColorLightGrey800,
                              fontSize: 14,
                              fontFamily: AppThemData.regular,
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(
                                  color: AppThemData.assetColorLightGrey700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundedButtonFill(
                      title: "Continue with Facebook".tr,
                      color: AppThemData.white,
                      textColor: AppThemData.assetColorGrey600,
                      fontFamily: AppThemData.bold,
                      isRight: false,
                      icon:
                          SvgPicture.asset("assets/icons/ic_facebook_food.svg"),
                      onPress: () {},
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    RoundedButtonFill(
                      title: "Continue with Google".tr,
                      color: AppThemData.white,
                      textColor: AppThemData.assetColorGrey600,
                      fontFamily: AppThemData.bold,
                      isRight: false,
                      icon: SvgPicture.asset("assets/icons/ic_google_food.svg"),
                      onPress: () {},
                    ),*/
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${'Hesabınız yok mu?'.tr} ",
                  style: const TextStyle(
                    fontFamily: AppThemData.regular,
                    color: AppThemData.assetColorLightGrey1000,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(const SignupScreen(),
                              transition: Transition.rightToLeftWithFade);
                        },
                      text: 'Kayıt ol'.tr,
                      style: const TextStyle(
                        color: AppThemData.foodAppOrange600,
                        fontFamily: AppThemData.regular,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<bool> login(String kullaniciAdi, String sifre) async {
  final response = await http.get(
      Uri.parse(
          "api="+kullaniciAdi+"&sifre="+sifre), // API endpoint'inizi buraya ekleyin
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

    );

    if (response.statusCode == 200) {
      // Başarılı giriş
     /* print('Giriş başarılı: ${response.body}');
      Preferences.setBoolean(Preferences.isLogin, true);
      Get.offAll(const DashBoardScreen(),
          transition: Transition.rightToLeftWithFade);*/
      print('Giriş başarılı: ${response.body}');
      Map<String, dynamic> veriMap = jsonDecode(response.body);

      // "giris" anahtarındaki liste
      List<dynamic> girisListesi = veriMap['giris'];

      // İlk giriş öğesi
      Map<String, dynamic> ilkGiris = girisListesi[0];

      // "kadi" değeri
      String kadi = ilkGiris['kadi'];
      String adi = ilkGiris['ad'];
      String soyadi = ilkGiris['soyad'];
      String uid = ilkGiris['uid'];
      String username = ilkGiris['kadi'];
      String FirmaLogo = ilkGiris['firmaLogo'];
      if (kadi.isNotEmpty) {
        print('Giriş başarılı: ${response.body}');
        Preferences.setBoolean(Preferences.isLogin, true);
        Preferences.pref.setString("adi", adi);
        Preferences.pref.setString("soyad", soyadi);
        Preferences.pref.setString("username", username);
        Preferences.pref.setString("uid", uid);
        Preferences.pref.setString("FirmaLogo", FirmaLogo);
        Get.offAll( DashBoardScreen (ad:adi,username:username,uid:uid),
            transition: Transition.rightToLeftWithFade);
        return true;
      }else{

        print('Giris uuid gelmedi: ${response.body}');
        return false;
      }
    } else {
      // Başarısız giriş
      GirisYapilmadi();
      print('Giriş başarısız: ${response.statusCode}');
      return false;
    }
  }
  void _showAlertDialogGirisYapmadi(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Giriş Yapılamadı'),
          content: Text('Giriş yapmak için bilgilerinizi kontrol ediniz!..'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapat
                // Evet'e tıklandığında yapılacak işlemleri burada ekleyebilirsiniz
                print('Evet tıklandı');
              },
              child: Text('Tamam'),
            ),

          ],
        );
      },
    );
  }
  void _showAlertDialogGirisYapti(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Hoşgeldiniz'),
          content: Text('Başarılı bir şekilde giriş yaptınız'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapat
                // Evet'e tıklandığında yapılacak işlemleri burada ekleyebilirsiniz
                print('Evet tıklandı');
              },
              child: Text('Tamam'),
            ),

          ],
        );
      },
    );
  }
}



class GirisYapilmadi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          decoration: BoxDecoration(color:  AppThemData.assetColorGrey900 , borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text("Giriş Bilgilerini Kontrol Edin",
                      style: TextStyle(
                        color:  AppThemData.assetColorGrey100 ,
                        fontFamily: AppThemData.semiBold,
                      )),
                ),
                const Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

