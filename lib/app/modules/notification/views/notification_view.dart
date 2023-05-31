import 'package:ev_station/app/services/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: paddingOnly(left: 20.kw, right: 20.kw, top: 60.kh),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Get.back(result: true),
                  child: CommonImageView(
                    height: 30.kh,
                    width: 30.kh,
                    fit: BoxFit.contain,
                    svgPath: ImageConstant.svgRoundedBack,
                  ),
                ),
              ),
              16.kwidthBox,
              LocaleKeys.my_profile_notification.tr.text600(20.kh,
                  textAlign: TextAlign.center, color: const Color(0xff077335)),
            ],
          ),
        ),
        30.kheightBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LocaleKeys.notification_push_notification.tr.text500(16.kh),
            16.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LocaleKeys.notification_pause_all.tr.text500(14.kh),
                Obx(
                  () => CupertinoSwitch(
                    trackColor: const Color(0xff6F6F6F),
                    activeColor: ColorUtil.labelGreen,
                    value: controller.isSwitch.value,
                    onChanged: (value) => controller.isSwitch.value = value,
                  ),
                )
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 20.kw)
      ],
    ));
  }
}
