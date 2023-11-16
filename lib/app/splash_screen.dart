import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';
import '../them/app_them_data.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            color: AppThemData.foodAppOrange600,
            child: Center(
              child: Image.asset("assets/img/splash_icon.png",width: 120.0,height: 100.0,),
            ),
          ),
        );
      },
    );
  }
}
