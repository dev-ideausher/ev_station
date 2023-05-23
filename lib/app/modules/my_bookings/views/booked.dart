import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../../services/index.dart';
import '../controllers/my_bookings_controller.dart';

class Booked extends GetView<MyBookingsController> {
  const Booked({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.paddingHorizontal,
      child: Column(
        children: [
          EvStationRoundedBox(
              color: const Color(0xffF0F0F0),
              child: Padding(
                padding: paddingSymmetric(horizontal: 20.kw, vertical: 14.kh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    'Dodge Challenger'.text600(16.kh),
                    4.kheightBox,
                    Row(
                      children: [
                        'Supercharger'.text400(14.kh),
                        const Spacer(),
                        'GECG-01254'
                            .text500(12.kh, color: ColorUtil.mainColor1),
                      ],
                    ),
                    16.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CommonImageView(
                                  height: 20.kh,
                                  width: 20.kh,
                                  svgPath: ImageConstant.svgBolt,
                                ),
                                4.kwidthBox,
                                'Type - 2'.text500(12.kh,
                                    color: ColorUtil.mainDarkColor1)
                              ],
                            ),
                            7.kheightBox,
                            Row(
                              children: [
                                CommonImageView(
                                  height: 20.kh,
                                  width: 20.kh,
                                  svgPath: ImageConstant.svgRefuel,
                                ),
                                4.kwidthBox,
                                'DC'.text500(12.kh,
                                    color: ColorUtil.mainDarkColor1)
                              ],
                            ),
                            7.kheightBox,
                            Row(
                              children: [
                                CommonImageView(
                                  height: 20.kh,
                                  width: 20.kh,
                                  svgPath: ImageConstant.svgCharge,
                                ),
                                4.kwidthBox,
                                '24Kw'.text500(12.kh,
                                    color: ColorUtil.mainDarkColor1)
                              ],
                            ),
                            7.kheightBox,
                          ],
                        ),
                        CommonImageView(
                          height: 75.kh,
                          width: 154.kw,
                          fit: BoxFit.contain,
                          imagePath: ImageConstant.pngDodgeCar,
                        )
                      ],
                    ),
                    9.kheightBox,
                    Row(
                      children: [
                        CommonImageView(
                          height: 20.kh,
                          width: 20.kh,
                          svgPath: ImageConstant.svgPointOnMap,
                        ),
                        4.kwidthBox,
                        '541, Centric Centre, 51  Avenue'.text400(12.kh)
                      ],
                    ),
                    20.kheightBox,
                    Row(
                      children: [
                        LocaleKeys.my_bookings_date.tr
                            .text400(12.kh, color: const Color(0xff088E42)),
                        4.kwidthBox,
                        '12th March 2023'.text400(12.kh),
                        const Spacer(),
                        LocaleKeys.my_bookings_time.tr
                            .text400(12.kh, color: const Color(0xff088E42)),
                        4.kwidthBox,
                        '15:30 Hrs (GMT)'.text400(12.kh),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
