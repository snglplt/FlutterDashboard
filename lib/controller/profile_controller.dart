import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/constant.dart';
import '../model/user_model.dart';

class ProfileController extends GetxController {
  Rx<UserModel> userModel = UserModel().obs;
  RxBool isLoading = true.obs;

  Rx<TextEditingController> fullTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> emailTextFiledController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberTextFiledController = TextEditingController().obs;

  RxString gender = "Male".obs;

  void handleGenderChange(String? value) {
    gender.value = value!;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.userJson).then((value) {
      userModel.value = UserModel.fromJson(value);
    });
    isLoading.value = false;
  }
}
