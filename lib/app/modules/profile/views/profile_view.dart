import 'package:ev_station/app/services/index.dart';
import 'package:ev_station/app/services/storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
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
              LocaleKeys.my_profile_my_profile.tr
                  .text600(20.kh, color: const Color(0xff077335)),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              children: [
                28.kheightBox,
                GetBuilder(builder: (ProfileController controller) {
                  return Column(
                    children: [
                      EvStationRoundedBox(
                          height: 115.kh,
                          width: 115.kh,
                          borderRadius: 100,
                          child: CommonImageView(
                            fit: BoxFit.cover,
                            url: Get.find<GetStorageService>().getProfileUrl,
                          )),
                      16.kheightBox,
                      Get.find<GetStorageService>().getName.text600(18.kh),
                    ],
                  );
                }),
                36.kheightBox,
                EvStationRoundedBox(
                    onTap: () => controller.onProfileDetailsTap(),
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
                            svgPath: ImageConstant.svgUser,
                          ),
                          8.kwidthBox,
                          LocaleKeys.my_profile_profile_details.tr
                              .text500(14.kh),
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
                    onTap: () => controller.onMyBookingsTap(),
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
                            svgPath: ImageConstant.svgCalendar2,
                          ),
                          8.kwidthBox,
                          LocaleKeys.my_profile_my_bookings.tr.text500(14.kh),
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
                    onTap: () => controller.onMySubscriptionTap(),
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
                            svgPath: ImageConstant.svgDollar,
                            svgColor: const Color(0xff1C274C),
                          ),
                          8.kwidthBox,
                          LocaleKeys.my_profile_my_subscription.tr
                              .text500(14.kh),
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
                    onTap: () => controller.onSettingsTap(),
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
                            svgPath: ImageConstant.svgSettings,
                            svgColor: const Color(0xff1C274C),
                          ),
                          8.kwidthBox,
                          LocaleKeys.my_profile_settings.tr.text500(14.kh),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.kh,
                          )
                        ],
                      ),
                    )),
                const Spacer(),
                EvStationRoundedBox(
                    onTap: () => controller.onLogoutTap(),
                    isBorder: true,
                    borderColor: const Color(0xffFF0000),
                    child: Padding(
                      padding:
                          paddingSymmetric(horizontal: 13.kw, vertical: 12.kh),
                      child: Row(
                        children: [
                          CommonImageView(
                            height: 20.kh,
                            width: 20.kh,
                            svgPath: ImageConstant.svgExit,
                          ),
                          8.kwidthBox,
                          LocaleKeys.my_profile_log_out.tr.text500(14.kh),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15.kh,
                          )
                        ],
                      ),
                    )),
                24.kheightBox
              ],
            ),
          ),
        )
      ],
    ));
  }
}
