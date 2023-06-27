import 'package:ev_station/app/services/storage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/lister_home_controller.dart';

class ListerHomeView extends GetView<ListerHomeController> {
  const ListerHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        62.kheightBox,
        Row(
          children: [
            Expanded(
              child:
                  '${LocaleKeys.lister_home_hello.tr} ${Get.find<GetStorageService>().getName}'
                      .text600(20.kh, color: ColorUtil.mainDarkColor1),
            ),
            //  const Spacer(),
            CommonImageView(
              height: 20.kh,
              width: 20.kh,
              svgPath: ImageConstant.svgLocationPin,
            ),
            4.kwidthBox,
            'Northampton'.text500(12.kh, color: Colors.black)
          ],
        ),
        24.kheightBox,
        Row(
          children: [
            Expanded(
              child: EvStationRoundedBox(
                  color: const Color(0xffF6F6F6),
                  isBorder: true,
                  borderWidth: 0.2.kh,
                  borderColor: const Color(0xffC0C0C0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LocaleKeys.lister_home_total_revenue.tr.text500(12.kh),
                      2.kheightBox,
                      '\$34.56'.text500(22.kh),
                      2.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonImageView(
                            height: 16.kh,
                            width: 16.kh,
                            svgPath: ImageConstant.svgArrowRightUp,
                          ),
                          4.kwidthBox,
                          '0.3%'.text500(12.kh, color: ColorUtil.labelGreen)
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 11.kh)),
            ),
            20.kwidthBox,
            Expanded(
              child: EvStationRoundedBox(
                  color: const Color(0xffF6F6F6),
                  isBorder: true,
                  borderWidth: 0.2.kh,
                  borderColor: const Color(0xffC0C0C0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      LocaleKeys.lister_home_total_visitors.tr.text500(12.kh),
                      2.kheightBox,
                      '112'.text500(22.kh),
                      2.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonImageView(
                            height: 16.kh,
                            width: 16.kh,
                            svgPath: ImageConstant.svgArrowRightUp,
                          ),
                          4.kwidthBox,
                          '0.3%'.text500(12.kh, color: ColorUtil.labelGreen)
                        ],
                      )
                    ],
                  ).paddingSymmetric(vertical: 11.kh)),
            ),
          ],
        ),
        24.kheightBox,
        '${LocaleKeys.lister_home_active_stations.tr} (5)'.text500(20.kh),
        16.kheightBox,
        EvStationRoundedBox(
            child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Walgreens - Brooklyn, NY'.text500(14.kh),
                    4.kheightBox,
                    'Brooklyn, 589 Prospect Avenue'.text400(10.kh),
                    4.kheightBox,
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: LocaleKeys.lister_home_charging_capacity.tr,
                          style: TextStyleUtil.genSans400(  
                              fontSize: 10.kh, color: Colors.black)),
                      TextSpan(
                          text: '11 Kw',
                          style: TextStyleUtil.genSans600(
                              fontSize: 10.kh, color: ColorUtil.labelGreen)),
                    ])),
                    10.kheightBox,
                    LocaleKeys.lister_home_revenue_in_total.tr.text400(10.kh),
                    2.kheightBox,
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: '\$35.33',
                          style: TextStyleUtil.genSans600(
                              fontSize: 16.kh, color: ColorUtil.labelGreen)),
                      TextSpan(
                          text: LocaleKeys.lister_home_this_month.tr,
                          style: TextStyleUtil.genSans400(
                              fontSize: 10.kh, color: const Color(0xff6B6B6B))),
                    ])),
                  ],
                ),
                CommonImageView(
                  svgPath: ImageConstant.svgCharger,
                )
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 20.kw, vertical: 7.kh))
      ],
    ).paddingSymmetric(horizontal: 20.kw));
  }
}
