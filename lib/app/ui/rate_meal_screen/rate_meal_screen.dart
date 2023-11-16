import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

import '../../../utils/dark_theme_provider.dart';

class RateMealScreen extends StatelessWidget {
  const RateMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: CommonUI.customAppBar(context,
          title: Text(
            "Rate your meal",
            style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
          ),
          isBack: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset("assets/images/ic_meal.svg")),
            Text(
              "Rate Your Experience",
              textAlign: TextAlign.center,
              style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Share your experience by rating your meal and providing valuable feedback",
              textAlign: TextAlign.center,
              style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.regular, fontSize: 16),
            ),
            const SizedBox(
              height: 24,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            const SizedBox(
              height: 36,
            ),
            RoundedButtonFill(
              title: "Share Review".tr,
              color: AppThemData.foodAppOrange600,
              textColor: AppThemData.white,
              fontFamily: AppThemData.bold,
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
