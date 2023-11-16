import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:selparteknolojidna/app/ui/address_screen/address_list_screen.dart';
import 'package:selparteknolojidna/app/ui/coupon_screen/coupon_screen.dart';
import 'package:selparteknolojidna/app/ui/select_payment_method_screen/select_payment_method_screen.dart';
import 'package:selparteknolojidna/app/ui/track_order_screen/track_order_screen.dart';
import 'package:selparteknolojidna/constant/constant.dart';
import 'package:selparteknolojidna/controller/cart_controller.dart';
import 'package:selparteknolojidna/model/cart_model.dart';
import 'package:selparteknolojidna/them/app_them_data.dart';
import 'package:selparteknolojidna/them/responsive.dart';
import 'package:selparteknolojidna/utils/dark_theme_provider.dart';
import 'package:selparteknolojidna/widgets/common_ui.dart';
import 'package:selparteknolojidna/widgets/my_separator.dart';
import 'package:selparteknolojidna/widgets/order_completed_dialog_box.dart';
import 'package:selparteknolojidna/widgets/round_button_fill.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: CartController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "The Olive Tree Mediterranean Bistro",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: controller.isLoading.value
                ? Constant.loader()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(const AddressListScreen(), transition: Transition.rightToLeftWithFade);
                            },
                            child: Container(
                              decoration: BoxDecoration(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "HomeTown",
                                      style: TextStyle(color: AppThemData.assetColorGrey400, fontFamily: AppThemData.semiBold, fontSize: 14),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset("assets/icons/ic_location_food.svg"),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Text(
                                            "6391 Elgin St, Delaware 10299",
                                            style:
                                                TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                                          ),
                                        ),
                                        SvgPicture.asset("assets/icons/ic_right_food.svg"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.zero,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: controller.productModel.value.productList!.length,
                                      itemBuilder: (context, index) {
                                        ProductList productModel = controller.productModel.value.productList![index];
                                        return ProductWidget(
                                          productModel: productModel,
                                        );
                                      }),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: MySeparator(color: AppThemData.assetColorGrey100),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Add Item",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                              fontSize: 14,
                                              height: 1.2,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          ),
                                        ),
                                        const Icon(Icons.add)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 34,
                          ),
                          const Text(
                            "Offers and Benefits",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppThemData.assetColorLightGrey1000,
                              fontSize: 14,
                              fontFamily: AppThemData.medium,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(const CouponScreen(), transition: Transition.rightToLeftWithFade);
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(14)),
                              child: Container(
                                color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Apply Coupon",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                            fontSize: 16,
                                            fontFamily: AppThemData.semiBold,
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.chevron_right,
                                        color: AppThemData.assetColorGrey400,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Bill Details",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: AppThemData.assetColorLightGrey1000,
                              fontSize: 14,
                              fontFamily: AppThemData.medium,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(14)),
                            child: Container(
                              color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              "Item Total",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${Constant.currency} 120.00",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                              fontSize: 16,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              "Delivery Cost",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${Constant.currency}  5.00",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                              fontSize: 16,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      child: MySeparator(color: AppThemData.assetColorGrey100),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              "Platform Fee",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${Constant.currency} 1.14",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                              fontSize: 16,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              "GST and Other Charges",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: AppThemData.assetColorLightGrey1000,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${Constant.currency} 9.00",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                              fontSize: 16,
                                              fontFamily: AppThemData.semiBold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 15),
                                      child: MySeparator(color: AppThemData.assetColorGrey100),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "Total Pay",
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600,
                                                fontSize: 16,
                                                fontFamily: AppThemData.semiBold,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${Constant.currency} 135.14",
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              color: AppThemData.foodAppOrange600,
                                              fontSize: 18,
                                              fontFamily: AppThemData.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            bottomNavigationBar: Container(
              color: AppThemData.foodAppOrange600,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Pay Vie".tr,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: AppThemData.white,
                                fontSize: 14,
                                fontFamily: AppThemData.regular,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const SelectPaymentMethodScreen(), transition: Transition.rightToLeftWithFade);
                              },
                              child: Row(
                                children: [
                                  SvgPicture.asset("assets/icons/ic_paypal_food.svg"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Paypal".tr,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: AppThemData.white,
                                      fontSize: 18,
                                      fontFamily: AppThemData.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset("assets/icons/ic_up_food.svg")
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      RoundedButtonFill(
                        width: Responsive.width(6, context),
                        height: Responsive.width(1.3, context),
                        title: "Pay Now".tr,
                        color: AppThemData.white,
                        textColor: AppThemData.foodAppOrange600,
                        fontFamily: AppThemData.bold,
                        onPress: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return OrderCompletedDialogBox(
                                  title: "Order Added Successfully",
                                  descriptions: "Your order has been added successfully. Sit back, relax, and get ready for a delicious meal coming your way! 🍽️🚀",
                                  onPress: () {
                                    Get.back();
                                    Get.to(const TrackOrderScreen(), transition: Transition.rightToLeftWithFade);
                                  },
                                  img: SvgPicture.asset('assets/icons/ic_check_icon_food.svg'),
                                  descriptions1: '',
                                );
                              });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ProductWidget extends StatefulWidget {
  final ProductList productModel;

  const ProductWidget({super.key, required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Rx<ProductList> productModel = widget.productModel.obs;
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productModel.name.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                    fontSize: 14,
                    height: 1.2,
                    fontFamily: AppThemData.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${Constant.currency}${widget.productModel.price}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                    fontSize: 14,
                    height: 1.0,
                    fontFamily: AppThemData.medium,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              productModel.value.quantity = (int.parse(productModel.value.quantity.toString()) + 1).toString();
            });
          },
          child: Container(
            height: Responsive.height(4, context),
            decoration: BoxDecoration(
                color: themeChange.getThem() ? AppThemData.assetColorGrey900 : AppThemData.white,
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                border: Border.all(color: AppThemData.foodAppOrange600)),
            child: Obx(
              () => Center(
                child: productModel.value.quantity == "0"
                    ? const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: AppThemData.medium,
                            color: AppThemData.foodAppOrange600,
                            fontSize: 14,
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    productModel.value.quantity = (int.parse(productModel.value.quantity.toString()) - 1).toString();
                                  });
                                },
                                child: const Icon(Icons.remove, color: AppThemData.foodAppOrange600)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${productModel.value.quantity}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: AppThemData.medium,
                                color: AppThemData.foodAppOrange600,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    productModel.value.quantity = (int.parse(productModel.value.quantity.toString()) + 1).toString();
                                  });
                                },
                                child: const Icon(Icons.add, color: AppThemData.foodAppOrange600)),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
