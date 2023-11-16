import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controller/notification_controller.dart';
import '../../../them/app_them_data.dart';
import '../../../utils/dark_theme_provider.dart';
import '../../../widgets/common_ui.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return GetX(
        init: NotificationController(),
        builder: (controller) {
          return Scaffold(
            appBar: CommonUI.customAppBar(context,
                title: Text(
                  "Notification Settings",
                  style: TextStyle(color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey600, fontFamily: AppThemData.semiBold, fontSize: 16),
                ),
                isBack: true),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Push Notifications",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 16,
                                  fontFamily: AppThemData.semiBold,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Enable or disable push notifications for order updates, promotions, and app alerts.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 12,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: AppThemData.foodAppOrange600,
                            value: controller.notificationSwitch.value,
                            onChanged: (value) {
                              controller.notificationSwitch.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(
                        color: AppThemData.assetColorGrey300,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email Notifications",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 16,
                                  fontFamily: AppThemData.semiBold,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Choose to receive important updates and offers via email.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 12,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: AppThemData.foodAppOrange600,
                            value: controller.emailNotification.value,
                            onChanged: (value) {
                              controller.emailNotification.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(
                        color: AppThemData.assetColorGrey300,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "SMS Notifications",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 16,
                                  fontFamily: AppThemData.semiBold,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Opt to receive notifications and offers via SMS messages.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 12,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            activeColor: AppThemData.foodAppOrange600,
                            value: controller.smsNotification.value,
                            onChanged: (value) {
                              controller.smsNotification.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(
                        color: AppThemData.assetColorGrey300,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Delivery Notifications",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 16,
                                  fontFamily: AppThemData.semiBold,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "Receive real-time updates on the status of your food delivery orders.",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: themeChange.getThem() ? AppThemData.assetColorGrey100 : AppThemData.assetColorGrey1000,
                                  fontSize: 12,
                                  fontFamily: AppThemData.regular,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: controller.deliveryNotification.value,
                            activeColor: AppThemData.foodAppOrange600,
                            onChanged: (value) {
                              controller.deliveryNotification.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Divider(
                        color: AppThemData.assetColorGrey300,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
