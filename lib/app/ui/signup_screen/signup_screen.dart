import 'dart:convert';
import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/login_screen/login_screen.dart';
import 'package:selparteknolojidna/controller/signup_controller.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';
import 'package:selparteknolojidna/widgets/text_field_widget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

/*
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});*/
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyForm(),
      debugShowCheckedModeBanner: false,
    );
  }
}
String selectedValue = 'Yedek Parça';
class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _vergiNoController = TextEditingController();
  final TextEditingController _vergiDairesiController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _gsmController = TextEditingController();
  final TextEditingController _adresController = TextEditingController();
  final TextEditingController _kullaniciAdiController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _servisTuru = '';

  File? _resim;
  File? imageFile;
  void _showAlertDialogLoginYapti(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Hoşgeldiniz'),
          content: Text('Başarılı bir şekilde kayıt Oluşturdunuz.. Giriş sayfasına yönlendiriliyorsunuz.'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapat
                // Evet'e tıklandığında yapılacak işlemleri burada ekleyebilirsiniz
                print('Evet tıklandı');
                Get.offAll(const LoginScreen(),transition: Transition.rightToLeftWithFade);
              },
              child: Text('Tamam'),
            ),

          ],
        );
      },
    );
  }

  Future<void>  _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _resim = File(pickedFile.path);
      }
    });
  }
  Future<void> getImageAndUpload() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);



    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path).readAsBytesSync() as File?;
      });
    }

  }



  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // API URL'si
      String apiUrl = 'https://pratikhasar.com/netting/selparDna.php';
      var uri = Uri.parse(apiUrl);
      final bytes = _resim!.readAsBytesSync();
      String base64Image = base64Encode(bytes);

      var request = http.MultipartRequest('POST', uri);
      request.fields['ad'] = _adController.text; // Ad verisi
      request.fields['soyad'] = _soyadController.text; // Soyad verisi
      request.fields['vergiNo'] = _vergiNoController.text; // Soyad verisi
      request.fields['vergiDairesi'] = _vergiDairesiController.text; // Soyad verisi
      request.fields['tel'] = _telefonController.text; // Soyad verisi
      request.fields['gsm'] = _gsmController.text; // Soyad verisi
      request.fields['kullaniciAdi'] = _kullaniciAdiController.text; // Soyad verisi
      request.fields['sifre'] = _sifreController.text; // Soyad verisi
      request.fields['adres'] = _adresController.text; // Soyad verisi
      request.fields['servisTuru'] = selectedValue;
      request.fields['resim'] = base64Image; // Soyad verisi
      //request.fields['resim'] = _resim != null ? base64Encode(_resim!.readAsBytesSync()) : null.toString(); // Soyad verisi
      request.fields['tur'] = 'uye_kayit'; // Soyad verisi

      // Göndermek istediğiniz dosya varsa, örneğin bir resim dosyası
      // request.files.add(await http.MultipartFile.fromPath('resim', 'resim_yolu'));

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Veri başarıyla gönderildi');
        _showAlertDialogLoginYapti(context);

      } else {
        print('Veri gönderme başarısız oldu: ${response.reasonPhrase}');
      }
/*
      try {
        // POST isteği gönder
        var response = await http.post(
          Uri.parse(apiUrl),

         // headers: {'Content-Type': 'application/json'},
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(postData),
        );

        // Başarılı bir şekilde gönderildiyse
        if (response.statusCode == 200) {
          // İstek başarılı, burada gerekirse işlemler yapabilirsiniz
          print('Başarıyla kaydedildi.');
          _showAlertDialogLoginYapti(context);
        } else {
          // İstek başarısız oldu
          print('Hata: ${response.statusCode}');

        }
      } catch (error) {
        // Hata durumunda
        print('Hata: $error');

      }*/
    }
    /*if (_formKey.currentState!.validate()) {
      // Form doğrulandığında burası çalışacak
      // Kaydetme işlemlerini burada gerçekleştirebilirsiniz

      // Örneğin, bu bilgileri bir veritabanına kaydetme kodu eklenebilir.
      // _ad, _soyad, _vergiNo, _vergiDairesi, _tel, _gsm, _kullaniciAdi, _sifre, _resim gibi değişkenleri kullanabilirsiniz.

      // Ardından formu sıfırla
      _formKey.currentState!.reset();

      // Resimi sıfırla
      setState(() {
        _resim = null;
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);


    _servisTuru = "Mekanik Servis";
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Yeni Üyelik Formu'.tr,
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Selpar Mobile üyesi olun".tr,
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
                height: 10,
              ),
              
              Text(
                "Selpar Mobile ile ayrıcalıkları yakalayın...".tr,
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
              if (_resim != null) Image.file(_resim!,width: 100,height: 100,),
              ElevatedButton(
                onPressed: _getImage,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrange),
                ),
                child: Text('Logo Seçiniz' ,),

              ),

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  controller: _adController,
                  decoration: InputDecoration(labelText: 'Ad',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adınızı girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _soyadController,
                  decoration: InputDecoration(labelText: 'Soyad',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen soyadınızı girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Sadece sayısal değerleri kabul etmek için
                    // (negatif sayıları da kabul etmek için FilteringTextInputFormatter.allow)
                  ],
                  controller: _vergiNoController,
                  decoration: InputDecoration(labelText: 'Vergi Numarası',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen vergi numaranızı girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _vergiDairesiController,
                  decoration: InputDecoration(labelText: 'Vergi Dairesi',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen vergi dairesini girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _telefonController,

                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Sadece sayısal değerleri kabul etmek için
                    // (negatif sayıları da kabul etmek için FilteringTextInputFormatter.allow)
                  ],
                  decoration: InputDecoration(labelText: 'Telefon',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen telefon numaranızı girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _adresController,

                  decoration: InputDecoration(labelText: 'Adres',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen adresinizi girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              // DropdownButton widget'ı kullanımı

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _gsmController,

                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    // Sadece sayısal değerleri kabul etmek için
                    // (negatif sayıları da kabul etmek için FilteringTextInputFormatter.allow)
                  ],
                  decoration: InputDecoration(labelText: 'Cep Telefonu',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen cep telefon numaranızı girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Servis Türü"),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child:  DropdownWidget()

                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _kullaniciAdiController,

                  decoration: InputDecoration(labelText: 'Kullanıcı Adı',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen kullanıcı adınızı girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _sifreController,

                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Şifre',
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0), // Border radius
                    ),),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Lütfen şifrenizi girin.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                  },
                ),
              ),
              SizedBox(height: 20),
              RoundedButtonFill(

                title: "Kayıt Ol".tr,
                color: AppThemData.foodAppOrange600,
                textColor: AppThemData.white,
                fontFamily: AppThemData.bold,
                onPress: _submitForm,
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: "${'Hesabınız mı var?'.tr} ",
            style: const TextStyle(
              fontFamily: AppThemData.regular,
              color: AppThemData.assetColorLightGrey1000,
            ),
            children: <TextSpan>[
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.offAll(const LoginScreen(),transition: Transition.rightToLeftWithFade);
                  },
                text: 'Giriş'.tr,
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


  }
}

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  // Başlangıçta seçili değer

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue!;
        });
      },
      items: <String>['Yedek Parça',
        'Mekanik Servis',
        'Hasar',
        'Kaporta']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    String selectedValue = "Yedek Parça";
    File? _image;
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

    // Seçilen resmin dosya nesnesi
    return GetBuilder(
        init: SignupController(),

        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context, isBack: true, backgroundColor: themeChange.getThem() ? AppThemData.assetColorGrey1000 : AppThemData.assetColorLightGrey400),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Selpar DNA üyesi olun".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                        fontSize: 24,
                        fontFamily: AppThemData.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Selpar DNA ile ayrıcalıkları yakalayın...".tr,
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
                      controller: controller.emailTextFiledController.value,
                      hintText: "Ad Soyad".tr,
                      title: "Ad Soyad".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/icons/ic_email_food.svg", height: 22, width: 22),
                      ),
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "Vergi No".tr,
                      title: "Vergi No".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.text_format, color: Colors.red, size: 22.0),
                      ),
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "Vergi Dairesi".tr,
                      title: "Vergi Dairesi".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.text_format, color: Colors.red, size: 22.0),
                      ),
                    ),

                    // DropdownButton widget'ı kullanımı
                    Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text("Servis Türü"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              value: selectedValue, // Seçili değer
                              items: <String>['Yedek Parça', 'Mekanik Servis', 'Hasar', 'Kaporta']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                // Dropdown'dan yeni değer seçildiğinde çağrılacak fonksiyon

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _image != null
                            ? Image.file(_image!)
                            : Placeholder(
                          fallbackHeight: 200.0,
                          fallbackWidth: double.infinity,
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _getImage,
                          child: Text('Resim Seç'),
                        ),
                      ],
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "Telefon".tr,
                      title: "Telefon".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.phone, color: Colors.red, size: 22.0),
                      ),
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "GSM".tr,
                      title: "GSM".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.phone, color: Colors.red, size: 22.0),
                      ),
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "Enter Email Address".tr,
                      title: "Email Address".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/icons/ic_email_food.svg", height: 22, width: 22),
                      ),
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "Enter Password".tr,
                      title: "Password".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/icons/ic_password_food.svg", height: 22, width: 22),
                      ),
                    ),
                    TextFieldWidget(
                      controller: controller.emailTextFiledController.value,
                      hintText: "Enter Confirm Password".tr,
                      title: "Confirm Password".tr,
                      prefix: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset("assets/icons/ic_password_food.svg", height: 22, width: 22),
                      ),
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    RoundedButtonFill(
                      title: "Sign up".tr,
                      color: AppThemData.foodAppOrange600,
                      textColor: AppThemData.white,
                      fontFamily: AppThemData.bold,
                      onPress: () {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 26),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Divider(color: AppThemData.assetColorLightGrey700),
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
                              child: Divider(color: AppThemData.assetColorLightGrey700),
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
                      icon: SvgPicture.asset("assets/icons/ic_facebook_food.svg"),
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
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "${'Don’t have an account?'.tr} ",
                  style: const TextStyle(
                    fontFamily: AppThemData.regular,
                    color: AppThemData.assetColorLightGrey1000,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.offAll(const LoginScreen(),transition: Transition.rightToLeftWithFade);
                        },
                      text: 'Login'.tr,
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
}
*/
