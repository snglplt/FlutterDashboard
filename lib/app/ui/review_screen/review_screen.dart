import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/rating_controller.dart';
import 'package:selparteknolojidna/model/review_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/network_image_widget.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return GetX(
        init: RatingController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Review",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                "What’s other think\nabout the\nrestaurants",
                                style: TextStyle(
                                    height: 1.2, color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: ShapeDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment(0.79, 0.61),
                                    end: Alignment(-0.79, -0.61),
                                    colors: [Color(0xFFFFF1EB), Color(0xFFF6F4CA)],
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset("assets/icons/ic_star_food.svg", height: 20, width: 20),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "3.5",
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: AppThemData.semanticColorWarning07,
                                              fontSize: 16,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Avg. Customer\n Ratings',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey600 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 29,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ratings",
                              style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000, fontFamily: AppThemData.medium, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            chartRow(context, "5", "120", 80, themeChange),
                            const SizedBox(
                              height: 8,
                            ),
                            chartRow(context, "4", "84", 71, themeChange),
                            const SizedBox(
                              height: 8,
                            ),
                            chartRow(context, "3", "68", 68, themeChange),
                            const SizedBox(
                              height: 8,
                            ),
                            chartRow(context, "2", "42", 42, themeChange),
                            const SizedBox(
                              height: 8,
                            ),
                            chartRow(context, "1", "15", 15, themeChange),
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        RoundedButtonFill(
                          title: "Share your rate".tr,
                          width: 35,
                          height: 5,
                          color: AppThemData.foodAppOrange600,
                          textColor: AppThemData.white,
                          fontFamily: AppThemData.bold,
                          onPress: () {},
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(
                          "All Ratings",
                          style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000, fontFamily: AppThemData.semiBold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.ratingModel.value.rating!.length,
                            itemBuilder: (context, index) {
                              Rating rating = controller.ratingModel.value.rating![index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: Container(
                                    decoration: BoxDecoration(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 38,
                                            width: 38,
                                            child: ClipOval(
                                              child: NetworkImageWidget(
                                                imageUrl: rating.image.toString(),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  rating.name.toString(),
                                                  style: TextStyle(
                                                      color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000, fontFamily: AppThemData.semiBold, fontSize: 16),
                                                ),
                                                const SizedBox(
                                                  height: 2,
                                                ),
                                                RatingBar.builder(
                                                  initialRating: double.parse(rating.rating.toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 18,
                                                  itemBuilder: (context, _) => const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
          );
        });
  }

  Widget chartRow(BuildContext context, String label, String review, int pct, themeChange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 1,
          style:  TextStyle(
            color: themeChange.getThem() ?AppThemData.assetColorGrey100:AppThemData.assetColorGrey600,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            fontFamily: AppThemData.semiBold,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SvgPicture.asset("assets/icons/ic_star_food.svg", height: 14, width: 14),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.010,
              decoration: BoxDecoration(color: AppThemData.assetColorGrey100, borderRadius: BorderRadius.circular(20)),
              child: const Text(''),
            ),
            Container(
              width: MediaQuery.of(context).size.width * (pct / 100) * 0.8,
              height: MediaQuery.of(context).size.height * 0.010,
              decoration: BoxDecoration(color: AppThemData.semanticColorWarning07, borderRadius: BorderRadius.circular(20)),
              child: const Text(''),
            ),
          ]),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          review,
          textAlign: TextAlign.center,
          maxLines: 1,
          style:  TextStyle(
            color: themeChange.getThem() ?AppThemData.assetColorGrey100:AppThemData.assetColorGrey600,
            fontSize: 14,
            overflow: TextOverflow.ellipsis,
            fontFamily: AppThemData.medium,
          ),
        ),
      ],
    );
  }
}
