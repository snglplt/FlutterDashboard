
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/coupon_model.dart';

class CouponController extends GetxController {
  Rx<CouponModel> couponModel = CouponModel().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.constantJson).then((value) {
      couponModel.value = CouponModel.fromJson(value);
    });
    isLoading.value = false;
  }
}
