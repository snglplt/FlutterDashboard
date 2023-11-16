
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/cart_model.dart';

class CartController extends GetxController {
  Rx<CartModel> productModel = CartModel().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.cartJson).then((value) {
      productModel.value = CartModel.fromJson(value);
    });
    print(productModel.value.productList!.length);
    isLoading.value = false;
  }
}
