
import 'package:get/get.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/model/restaurant_model.dart';

class FavouriteRestaurantController extends GetxController {
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
