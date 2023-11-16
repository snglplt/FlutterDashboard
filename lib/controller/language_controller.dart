import 'package:get/get.dart';
import 'package:selparteknolojidna/services/preferences.dart';

class LanguageController extends GetxController {
  RxString selectedLanguage = "English".obs;

  void handleLanguageChange(String? value) {
    selectedLanguage.value = value!;
  }

  RxBool isLoading = true.obs;

  getLightDarkMode() async {
    if (Preferences.getString(Preferences.languageKey).toString().isNotEmpty) {
      selectedLanguage.value = Preferences.getString(Preferences.languageKey).toString();
    }
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    getLightDarkMode();
    // TODO: implement onInit
    super.onInit();
  }
}
