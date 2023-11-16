import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/model/category_model.dart';
import 'package:selparteknolojidna/model/search_model.dart';

class SearchScreenController extends GetxController {
  Rx<TextEditingController> searchTextFiledController = TextEditingController().obs;

  Rx<CategoryModel> categoryModel = CategoryModel().obs;
  Rx<SearchModel> searchModel = SearchModel().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.categoryJson).then((value) {
      categoryModel.value = CategoryModel.fromJson(value);
    });
    await Constant.loadJson(path: Constant.searchJson).then((value) {
      searchModel.value = SearchModel.fromJson(value);
    });

    isLoading.value = false;
  }
}
