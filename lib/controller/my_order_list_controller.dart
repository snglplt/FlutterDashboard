
import 'package:get/get.dart';

import '../constant/constant.dart';
import '../model/my_order_list_model.dart';

class MyOrderListController extends GetxController {
  Rx<MyOrderListModel> myOrderListModel = MyOrderListModel().obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    loadJson();
    super.onInit();
  }

  loadJson() async {
    await Constant.loadJson(path: Constant.orderJson).then((value) {
      myOrderListModel.value = MyOrderListModel.fromJson(value);
    });
    isLoading.value = false;
  }
}
