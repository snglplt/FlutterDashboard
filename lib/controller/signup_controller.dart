import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  Rx<TextEditingController> fullNameTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> emailTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> passwordTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> conformTextFiledController = TextEditingController().obs;
}
