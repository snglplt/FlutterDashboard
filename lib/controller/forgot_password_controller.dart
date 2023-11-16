import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  Rx<TextEditingController> emailTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> pinController = TextEditingController().obs;

  Rx<TextEditingController> passwordTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> conformPasswordTextFiledController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
