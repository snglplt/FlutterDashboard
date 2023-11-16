
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/restaurant_model.dart';

class RestaurantListController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<Restaurant> restaurantModel = Restaurant().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.restaurantJson).then((value) {
      restaurantModel.value = Restaurant.fromJson(value);
    });
    isLoading.value = false;
  }
}
