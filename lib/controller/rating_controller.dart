
import 'package:get/get.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/model/review_model.dart';

class RatingController extends GetxController{
  Rx<ReviewModel> ratingModel = ReviewModel().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.ratingJson).then((value) {
      ratingModel.value = ReviewModel.fromJson(value);
    });
    isLoading.value = false;
  }

}