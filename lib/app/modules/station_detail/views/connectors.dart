import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/station_detail_controller.dart';

class Connectors extends GetView<StationDetailController> {
  const Connectors({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: 20.paddingHorizontal,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: LocaleKeys.station_detail_available_connectors.tr,
                style: TextStyleUtil.genSans400(
                    fontSize: 14.kh, color: Colors.black)),
            TextSpan(
                text: '5',
                style: TextStyleUtil.genSans500(
                    fontSize: 14.kh, color: ColorUtil.mainColor1))
          ])),
          16.kheightBox,
          Column(
            children: List.generate(
              2,
              (index) => Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5.kh,
                            spreadRadius: 5,
                            color: const Color(0xff767676).withOpacity(0.08),
                            // color: Colors.black,
                            offset: const Offset(0, -2.5)),
                      ],
                    ),
                    child: EvStationRoundedBox(
                        child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18.kw, vertical: 6.kh),
                          color: ColorUtil.kGreen02,
                          child: Row(
                            children: [
                              'Charger - A'.text500(12.kh, color: Colors.white),
                              ' | '.text500(14.kh, color: Colors.white),
                              'Charging point 1'
                                  .text400(12.kh, color: Colors.white),
                              const Spacer(),
                              EvStationRoundedBox(
                                  isBorder: true,
                                  borderColor: Colors.white,
                                  color: ColorUtil.kGreen02,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.kw, vertical: 1.kh),
                                    child: 'AC'
                                        .text500(10.kh, color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 18.kw,
                              right: 13.kw,
                              top: 13.kh,
                              bottom: 9.kh),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CommonImageView(
                                        height: 24.kh,
                                        width: 24.kh,
                                        svgPath: ImageConstant.svgAcType2,
                                      ),
                                      8.kwidthBox,
                                      'AC Type - 2'.text500(12.kh)
                                    ],
                                  ),
                                  8.kheightBox,
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: LocaleKeys
                                            .station_detail_capacity.tr,
                                        style: TextStyleUtil.genSans400(
                                            fontSize: 12.kh,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '8.4kW',
                                        style: TextStyleUtil.genSans500(
                                            fontSize: 14.kh,
                                            color: Colors.black))
                                  ])),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: '\$1.75/ ',
                                        style: TextStyleUtil.genSans400(
                                            fontSize: 12.kh,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: '15 mins',
                                        style: TextStyleUtil.genSans500(
                                            fontSize: 12.kh,
                                            color: Colors.black))
                                  ])),
                                  11.kheightBox,
                                  EvStationButton(
                                    onPressed: () {},
                                    height: 32.kh,
                                    fontSize: 12.kh,
                                    label: LocaleKeys
                                        .station_detail_start_a_new_session.tr,
                                    color: ColorUtil.labelGreen,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  24.kheightBox
                ],
              ),
            ),
          ),
          12.kheightBox,
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: LocaleKeys.station_detail_connectors_in_use.tr,
                style: TextStyleUtil.genSans400(
                    fontSize: 14.kh, color: Colors.black)),
            TextSpan(
                text: '5',
                style: TextStyleUtil.genSans500(
                    fontSize: 14.kh, color: ColorUtil.mainColor1))
          ])),
          16.kheightBox,
          DecoratedBox(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5.kh,
                    spreadRadius: 5,
                    color: const Color(0xff767676).withOpacity(0.08),
                    // color: Colors.black,
                    offset: const Offset(0, -2.5)),
              ],
            ),
            child: EvStationRoundedBox(
                child: Column(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.kw, vertical: 6.kh),
                  color: ColorUtil.kBlack02,
                  child: Row(
                    children: [
                      'Charger - A'.text500(12.kh, color: Colors.white),
                      ' | '.text500(14.kh, color: Colors.white),
                      'Charging point 1'.text400(12.kh, color: Colors.white),
                      const Spacer(),
                      EvStationRoundedBox(
                          isBorder: true,
                          borderColor: Colors.white,
                          color: ColorUtil.kBlack02,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.kw, vertical: 1.kh),
                            child: ''.text500(10.kh, color: Colors.white),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 18.kw, right: 13.kw, top: 13.kh, bottom: 9.kh),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CommonImageView(
                                height: 24.kh,
                                width: 24.kh,
                                svgColor: ColorUtil.kBlack02,
                                svgPath: ImageConstant.svgAcType2,
                              ),
                              8.kwidthBox,
                              'AC Type - 2'.text500(12.kh)
                            ],
                          ),
                          8.kheightBox,
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: LocaleKeys.station_detail_capacity.tr,
                                style: TextStyleUtil.genSans400(
                                    fontSize: 12.kh, color: Colors.black)),
                            TextSpan(
                                text: '8.4kW',
                                style: TextStyleUtil.genSans500(
                                    fontSize: 14.kh, color: Colors.black))
                          ])),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '\$1.75/ ',
                                style: TextStyleUtil.genSans400(
                                    fontSize: 12.kh, color: Colors.black)),
                            TextSpan(
                                text: '15 mins',
                                style: TextStyleUtil.genSans500(
                                    fontSize: 12.kh, color: Colors.black))
                          ])),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
