import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selparteknolojidna/lang/app_tr.dart';

import '../lang/app_ar.dart';
import '../lang/app_de.dart';
import '../lang/app_en.dart';
import '../lang/app_fr.dart';
import '../lang/app_hi.dart';
import '../lang/app_ja.dart';
import '../lang/app_pt.dart';
import '../lang/app_ru.dart';
import '../lang/app_zh.dart';

class LocalizationService extends Translations {
  // Default locale
  static const locale = Locale('en', 'US');

  static final locales = [
    const Locale('en'),
    const Locale('fr'),
    const Locale('zh'),
    const Locale('ja'),
    const Locale('hi'),
    const Locale('de'),
    const Locale('pt'),
    const Locale('ru'),
    const Locale('ar'),
    const Locale('tr'),
  ];

  // Keys and their translations
  // Translations are separated maps in `lang` file
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUS,
        'fr': trFR,
        'zh': zhCH,
        'ja': jaJP,
        'hi': hiIN,
        'de': deGR,
        'pt': ptPO,
        'ru': ruRU,
        'ar': lnAr,
        'tr': trTR,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    Get.updateLocale(Locale(lang));
  }
}
