import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/station_detail_controller.dart';

class Chargers extends GetView<StationDetailController> {
  const Chargers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          EvStationRoundedBox(
              isBorder: true,
              borderWidth: 1.kh,
              borderColor: const Color(0xffDCDCDC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: 5.kh, color: ColorUtil.labelGreen),
                  10.kheightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          '24 hours'.text400(16.kh),
                          const Spacer(),
                          LocaleKeys.common_available.tr
                              .text500(16.kh, color: ColorUtil.labelGreen),
                          '  ·  '.text600(25.kh, color: ColorUtil.labelGreen),
                        ],
                      ),
                      13.kheightBox,
                      Divider(
                          color: const Color(0xffA3A3A3).withOpacity(0.7),
                          height: 0.5.kh,
                          thickness: 0.5.kh),
                      17.kheightBox,
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      LocaleKeys.station_detail_tesla_plug.tr
                                          .text400(14.kh),
                                      '  ·  '.text600(25.kh),
                                      LocaleKeys.station_detail_acdc.tr
                                          .text400(14.kh),
                                    ],
                                  ),
                                  10.kheightBox,
                                  CommonImageView(
                                    height: 30.kh,
                                    width: 30.kh,
                                    svgPath: ImageConstant.svgAcType2,
                                    svgColor: Colors.black,
                                  )
                                ],
                              ),
                            ),
                            13.kwidthBox,
                            Container(
                                // height: 1.kh,
                                width: 0.5.kw,
                                color:
                                    const Color(0xffA3A3A3).withOpacity(0.7)),
                            13.kwidthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LocaleKeys.station_detail_max_power.tr
                                      .text400(14.kh),
                                  10.kheightBox,
                                  '110 Kw'.text600(24.kh),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.kheightBox,
                      Divider(
                          color: const Color(0xffA3A3A3).withOpacity(0.7),
                          height: 0.5.kh,
                          thickness: 0.5.kh),
                      15.kheightBox,
                      EvStationButton(
                          height: 36.kh,
                          fontSize: 14.kh,
                          onPressed: () {},
                          label: LocaleKeys.station_detail_book.tr),
                    ],
                  ).paddingSymmetric(horizontal: 15.kw),
                  17.kheightBox
                ],
              )),
          20.kheightBox,
          EvStationRoundedBox(
              isBorder: true,
              borderWidth: 1.kh,
              borderColor: const Color(0xffDCDCDC),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(height: 5.kh, color: ColorUtil.lightRed),
                  10.kheightBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          '24 hours'.text400(16.kh),
                          const Spacer(),
                          LocaleKeys.common_not_available.tr
                              .text500(16.kh, color: ColorUtil.lightRed),
                          '  ·  '.text600(25.kh, color: ColorUtil.lightRed),
                        ],
                      ),
                      13.kheightBox,
                      Divider(
                          color: const Color(0xffA3A3A3).withOpacity(0.7),
                          height: 0.5.kh,
                          thickness: 0.5.kh),
                      17.kheightBox,
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      LocaleKeys.station_detail_tesla_plug.tr
                                          .text400(14.kh),
                                      '  ·  '.text600(25.kh),
                                      LocaleKeys.station_detail_acdc.tr
                                          .text400(14.kh),
                                    ],
                                  ),
                                  10.kheightBox,
                                  CommonImageView(
                                    height: 30.kh,
                                    width: 30.kh,
                                    svgPath: ImageConstant.svgAcType2,
                                    svgColor: Colors.black,
                                  )
                                ],
                              ),
                            ),
                            13.kwidthBox,
                            Container(
                                // height: 1.kh,
                                width: 0.5.kw,
                                color:
                                    const Color(0xffA3A3A3).withOpacity(0.7)),
                            13.kwidthBox,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LocaleKeys.station_detail_max_power.tr
                                      .text400(14.kh),
                                  10.kheightBox,
                                  '110 Kw'.text600(24.kh),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      10.kheightBox,
                      Divider(
                          color: const Color(0xffA3A3A3).withOpacity(0.7),
                          height: 0.5.kh,
                          thickness: 0.5.kh),
                      15.kheightBox,
                      EvStationButton(
                          isActive: false,
                          height: 36.kh,
                          fontSize: 14.kh,
                          onPressed: () {},
                          label: LocaleKeys.station_detail_book.tr),
                    ],
                  ).paddingSymmetric(horizontal: 15.kw),
                  17.kheightBox
                ],
              )),
        ]).paddingSymmetric(horizontal: 20.kw);
  }
}
