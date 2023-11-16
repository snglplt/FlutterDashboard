import 'package:get/get.dart';

class SelectPaymentController extends GetxController {
  RxString paymentSelect = "Male".obs;

  void handleGenderChange(String? value) {
    paymentSelect.value = value!;
  }
}
