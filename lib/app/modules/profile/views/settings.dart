import 'package:ev_station/app/modules/profile/controllers/profile_controller.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/get_utils.dart';

class Settings extends GetView<ProfileController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: CommonImageView(
                    height: 30.kh,
                    width: 30.kh,
                    fit: BoxFit.contain,
                    svgPath: ImageConstant.svgRoundedBack,
                  ),
                ),
              ),
              16.kwidthBox,
              LocaleKeys.my_profile_settings.tr.text600(20.kh,
                  textAlign: TextAlign.center, color: const Color(0xff077335)),
            ],
          ).paddingOnly(left: 20.kw, right: 20.kw, top: 60.kh),
          30.kheightBox,
          Column(
            children: [
              EvStationRoundedBox(
                  onTap: () => controller.onCardPaymentTap(),
                  isBorder: true,
                  borderColor: ColorUtil.mainDarkColor1,
                  child: Padding(
                    padding:
                        paddingSymmetric(horizontal: 13.kw, vertical: 12.kh),
                    child: Row(
                      children: [
                        CommonImageView(
                          height: 20.kh,
                          width: 20.kh,
                          svgPath: ImageConstant.svgCard,
                          svgColor: const Color(0xff1C274C),
                        ),
                        8.kwidthBox,
                        LocaleKeys.my_profile_card_payments.tr.text500(14.kh),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15.kh,
                        )
                      ],
                    ),
                  )),
              16.kheightBox,
              EvStationRoundedBox(
                  onTap: () => controller.onNotificationTap(),
                  isBorder: true,
                  borderColor: ColorUtil.mainDarkColor1,
                  child: Padding(
                    padding:
                        paddingSymmetric(horizontal: 13.kw, vertical: 12.kh),
                    child: Row(
                      children: [
                        CommonImageView(
                          height: 20.kh,
                          width: 20.kh,
                          svgPath: ImageConstant.svgNotification,
                          svgColor: const Color(0xff1C274C),
                        ),
                        8.kwidthBox,
                        LocaleKeys.my_profile_notification.tr.text500(14.kh),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15.kh,
                        )
                      ],
                    ),
                  )),
            ],
          ).paddingSymmetric(horizontal: 20.kw),
        ],
      ),
    );
  }
}
