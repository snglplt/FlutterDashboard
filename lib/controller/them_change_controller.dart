import 'package:get/get.dart';
import 'package:selparteknolojidna/services/preferences.dart';

class ThemChangeController extends GetxController {
  RxString lightDarkMode = "Light".obs;

  void handleGenderChange(String? value) {
    lightDarkMode.value = value!;
  }

  RxBool isLoading = true.obs;

  getLightDarkMode() async {
    if (Preferences.getString(Preferences.themKey).toString().isNotEmpty) {
      lightDarkMode.value = Preferences.getString(Preferences.themKey).toString();
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
