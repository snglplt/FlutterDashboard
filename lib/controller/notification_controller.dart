import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool notificationSwitch = true.obs;
  RxBool emailNotification = true.obs;
  RxBool smsNotification = true.obs;
  RxBool deliveryNotification = true.obs;
}
