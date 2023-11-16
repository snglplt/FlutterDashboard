import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/ui/home_screen/home_screen.dart';
import '../app/ui/my_cart_screen/my_cart_screen.dart';
import '../app/ui/my_order_list/my_order_list_screen.dart';
import '../app/ui/profile_screen/profile_screen.dart';
import '../app/ui/search_screen/search_screen.dart';

class DashBoardController extends GetxController {
  final RxString myData = "".obs;
  final RxString username = "".obs;
  final RxString uid = "".obs;
  @override
  void initState(String data,String username,String uid) {
    setData(data,username,uid); // Widget başladığında çağrılacak fonksiyon
  }


  void setData(String data,username,uid) {
    myData.value = data;
    username.value = username;
    uid.value = uid;
  }
  late RxList pageList;
  DashBoardController() {
    // Initialize pageList in the constructor
     pageList = [
      HomeScreen(ad: this.myData.value.obs,username: this.username.value.obs,uid: this.uid.value.obs),
      const MyCartScreen(),
      const SearchScreen(),
      const MyOrderListScreen(isActionBarShow: false),
      const ProfileScreen(),
      // Other screens...
    ].obs;
  }
  RxInt selectedIndex = 0.obs;
  /*RxList pageList = [
      HomeScreen(ad: myData.value),
    const MyCartScreen(),
    const SearchScreen(),
    const MyOrderListScreen(isActionBarShow: false),
    const ProfileScreen(),
  ].obs;*/

  PageController pageController = PageController(
    initialPage: 0,
  );





  void onItemTapped(int index) {
    selectedIndex.value = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
