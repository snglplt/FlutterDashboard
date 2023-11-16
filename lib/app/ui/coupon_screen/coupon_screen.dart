import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../../controller/coupon_controller.dart';
import '../../../model/coupon_model.dart';
import '../../../them/app_them_data.dart';
import '../../../them/responsive.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';
import '../../../widgets/coupon_dialog_box.dart';
import '../../../widgets/my_separator.dart';
import '../../../widgets/text_field_widget.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: CouponController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Coupon Code",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: InkWell(
                            onTap: () {},
                            child: TextFieldWidget(
                              controller: null,
                              hintText: "Search Coupon code here",
                              prefix: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset("assets/icons/ic_search_home_food.svg", height: 22, width: 22),
                              ),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.couponModel.value.couponList!.length,
                          itemBuilder: (context, index) {
                            CouponList couponModel = controller.couponModel.value.couponList![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(14)),
                                child: Container(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset("assets/icons/ic_ticket_food.svg"),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "${couponModel.offValue.toString()}%",
                                                    textAlign: TextAlign.start,
                                                    style: const TextStyle(
                                                      color: AppThemData.foodAppOrange600,
                                                      fontSize: 20,
                                                      fontFamily: AppThemData.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    couponModel.description.toString(),
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                                      fontSize: 16,
                                                      fontFamily: AppThemData.semiBold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Valid for orders over \$30",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                            fontSize: 12,
                                            fontFamily: AppThemData.medium,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: Responsive.height(4.5, context),
                                          width: Responsive.height(16, context),
                                          decoration: BoxDecoration(
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                                              border: Border.all(color: AppThemData.foodAppOrange600)),
                                          child: Center(
                                            child: Text(
                                              couponModel.code.toString(),
                                              style: const TextStyle(
                                                fontFamily: AppThemData.medium,
                                                color: AppThemData.foodAppOrange600,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 20),
                                          child: MySeparator(color: AppThemData.assetColorGrey100),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return CouponDialogBox(
                                                    title: "SAVE200OFF applied",
                                                    descriptions: "You Saved \$ 5.00 on this order",
                                                    onPress: () {
                                                      Get.back();
                                                    },
                                                    img: SvgPicture.asset('assets/icons/ic_check_icon_food.svg'),
                                                    descriptions1: 'with this coupon code',
                                                  );
                                                });
                                          },
                                          child: const Center(
                                            child: Text(
                                              "Tap To Apply",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppThemData.foodAppOrange600,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
          );
        });
  }
}
