import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

import '../them/app_them_data.dart';
import '../them/responsive.dart';
import '../utils/dark_theme_provider.dart';

class CouponDialogBox extends StatefulWidget {
  final String title, descriptions, descriptions1;
  final Widget img;
  final Function() onPress;

  const CouponDialogBox({Key? key, required this.title, required this.descriptions, required this.img, required this.onPress, required this.descriptions1}) : super(key: key);

  @override
  _CouponDialogBoxState createState() => _CouponDialogBoxState();
}

class _CouponDialogBoxState extends State<CouponDialogBox> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, themeChange),
    );
  }

  contentBox(context, themeChange) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: const DecorationImage(image: AssetImage("assets/images/popup.png"), fit: BoxFit.fill),
        color: AppThemData.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.img,
          const SizedBox(
            height: 30,
          ),
          Visibility(
            visible: widget.title.isNotEmpty,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: AppThemData.assetColorGrey600,
                fontSize: 16,
                fontFamily: AppThemData.regular,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: widget.descriptions.isNotEmpty,
            child: Text(
              widget.descriptions,
              style: const TextStyle(
                color: AppThemData.assetColorGrey600,
                fontSize: 18,
                fontFamily: AppThemData.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
            visible: widget.descriptions1.isNotEmpty,
            child: Text(
              widget.descriptions1,
              style: const TextStyle(
                color: AppThemData.assetColorGrey600,
                fontSize: 16,
                fontFamily: AppThemData.regular,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          RoundedButtonFill(
            height: Responsive.width(1.3, context),
            title: "Continue".tr,
            color: AppThemData.foodAppOrange600,
            textColor: AppThemData.white,
            fontFamily: AppThemData.bold,
            onPress: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
