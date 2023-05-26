import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/station_detail_controller.dart';

class Info extends GetView<StationDetailController> {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LocaleKeys.station_detail_about.tr.text600(20.kh),
          10.kheightBox,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.'
              .text400(16.kh),
          25.kheightBox,
          EvStationRoundedBox(
              isBorder: true,
              borderWidth: 1.kh,
              borderColor: const Color(0xffDCDCDC),
              color: const Color(0xffFAFAFA),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LocaleKeys.station_detail_amenities.tr.text500(20.kh),
                  10.kheightBox,
                  Divider(
                      color: const Color(0xffA3A3A3).withOpacity(0.7),
                      height: 0.5.kh,
                      thickness: 0.5.kh),
                  16.kheightBox,
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonImageView(
                            height: 24.kh,
                            width: 24.kh,
                            svgPath: ImageConstant.svgCafeteria,
                          ),
                          8.kwidthBox,
                          LocaleKeys.station_detail_cafeteria.tr.text400(16.kh)
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CommonImageView(
                            height: 24.kh,
                            width: 24.kh,
                            svgPath: ImageConstant.svgCafeteria,
                          ),
                          8.kwidthBox,
                          LocaleKeys.station_detail_cafeteria.tr.text400(16.kh)
                        ],
                      ),
                    ],
                  ),
                ],
              ).paddingAll(16.kh)),
          24.kheightBox,
          LocaleKeys.station_detail_location.tr.text600(20.kh),
          10.kheightBox,
          Row(
            children: [
              CommonImageView(
                height: 20.kh,
                width: 20.kh,
                svgPath: ImageConstant.svgLocationPin,
                svgColor: ColorUtil.labelGreen,
              ),
              8.kwidthBox,
              'Brooklyn, 589 Prospect Avenue'.text400(16.kh)
            ],
          ),
          16.kheightBox,
          EvStationRoundedBox(
              height: 180.kh,
              color: Colors.red.withOpacity(0.3),
              child: Container())
        ]).paddingSymmetric(horizontal: 20.kw);
  }
}
