import 'package:ev_station/app/components/ev_station_button.dart';
import 'package:ev_station/app/components/common_image_view.dart';
import 'package:ev_station/app/constants/image_constant.dart';
import 'package:ev_station/app/services/colors.dart';
import 'package:ev_station/app/services/text_style_util.dart';
import 'package:ev_station/app/services/responsive_size.dart';
import 'package:ev_station/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CommonImageView(
          height: 100.h,
          width: 100.w,
          imagePath: ImageConstant.pngBackground1,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.39),
              Colors.black.withOpacity(0.86),
            ],
          )),
        ),
        Container(
          height: 585.kh,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0),
              Colors.black.withOpacity(1),
            ],
          )),
        ),
        Padding(
          padding: 20.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              77.kheightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: CommonImageView(
                  height: 97.kh,
                  width: 245.kw,
                  fit: BoxFit.contain,
                  svgPath: ImageConstant.svgGgcTitle,
                ),
              ),
              const Spacer(),
              RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: LocaleKeys.onboarding_we_got_you.tr,
                      style: TextStyleUtil.genSans600(fontSize: 28.kh)),
                  TextSpan(
                      text: LocaleKeys.onboarding_fastest_services.tr,
                      style: TextStyleUtil.genSans600(
                          fontSize: 28.kh, color: ColorUtil.labelGreen))
                ],
              )),
              16.kheightBox,
              LocaleKeys.onboarding_get_our_service.tr
                  .text500(16.kh, color: Colors.white),
              36.kheightBox,
              EvStationButton(
                  onPressed: () => controller.onJoinAsUserTap(),
                  label: LocaleKeys.onboarding_join_as_a_user.tr),
              16.kheightBox,
              EvStationButton(
                  onPressed: () => controller.onJoinAsUserTap(),
                  label: LocaleKeys.onboarding_join_as_a_lister.tr),
              81.kheightBox
            ],
          ),
        )
      ],
    ));
  }
}
