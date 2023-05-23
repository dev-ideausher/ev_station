import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trip_navigation_controller.dart';

class TripNavigationView extends GetView<TripNavigationController> {
  const TripNavigationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Padding(
          padding: paddingOnly(bottom: 57.kh, left: 20.kw, right: 20.kw),
          child: EvStationButton(
            onPressed: () {},
            label: LocaleKeys.trip_start_navigation.tr,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: paddingOnly(right: 20.kw, top: 60.kh),
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        68.kwidthBox,
                        Expanded(
                          child: Column(
                            children: [
                              EvStationRoundedBox(
                                  borderColor: ColorUtil.labelGreen,
                                  isBorder: true,
                                  child: EvStationTextField(
                                    controller:
                                        controller.yourLocationController,
                                    hintStyle: TextStyleUtil.genSans500(
                                        fontSize: 14.kh,
                                        color: const Color(0xffA1A1A1)),
                                    prefixIcon: Padding(
                                      padding: paddingSymmetric(
                                          horizontal: 18.kw, vertical: 12.kh),
                                      child: CommonImageView(
                                        height: 24.kh,
                                        width: 24.kh,
                                        fit: BoxFit.contain,
                                        svgColor: ColorUtil.labelGreen,
                                        svgPath: ImageConstant.svgSearch,
                                      ),
                                    ),
                                    hint: LocaleKeys.trip_your_location.tr,
                                    textFillColor: Colors.transparent,
                                  )),
                              12.kheightBox,
                              EvStationRoundedBox(
                                  borderColor: ColorUtil.labelGreen,
                                  isBorder: true,
                                  child: EvStationTextField(
                                    controller:
                                        controller.destinationController,
                                    onTap: () => controller.onTextfieldTap(),
                                    hintStyle: TextStyleUtil.genSans500(
                                        fontSize: 14.kh,
                                        color: const Color(0xffA1A1A1)),
                                    prefixIcon: Padding(
                                      padding: paddingSymmetric(
                                          horizontal: 18.kw, vertical: 12.kh),
                                      child: CommonImageView(
                                        height: 24.kh,
                                        width: 24.kh,
                                        fit: BoxFit.contain,
                                        svgColor: ColorUtil.labelGreen,
                                        svgPath: ImageConstant.svgSearch,
                                      ),
                                    ),
                                    hint: LocaleKeys.trip_enter_destination.tr,
                                    textFillColor: Colors.transparent,
                                  )),
                              17.kheightBox
                            ],
                          ),
                        ),
                        17.kwidthBox,
                        GestureDetector(
                          onTap: () => controller.onOptionTap(),
                          child: CommonImageView(
                            height: 30.kh,
                            width: 30.kh,
                            fit: BoxFit.contain,
                            svgPath: ImageConstant.svgRoundedOption,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: 20.paddingLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: CommonImageView(
                          height: 30.kh,
                          width: 30.kh,
                          svgPath: ImageConstant.svgRoundedBack,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // 20.kheightBox,
            Expanded(
              child: Container(
                color: Colors.green[100],
              ),
            ),
            // Padding(
            //   padding:
            //       EdgeInsets.only(left: 20.kw, right: 20.kw, bottom: 75.kh),
            //   child: EvStationRoundedBox(
            //       onTap: () => controller.onStationTap(),
            //       child: Column(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           Padding(
            //             padding: 18.paddingHorizontal,
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 23.kheightBox,
            //                 Row(
            //                   mainAxisSize: MainAxisSize.min,
            //                   children: [
            //                     EvStationRoundedBox(
            //                         color: Colors.black12,
            //                         borderRadius: 4.kh,
            //                         child: SizedBox(
            //                           height: 78.kh,
            //                           width: 82.kw,
            //                         )),
            //                     16.kwidthBox,
            //                     Expanded(
            //                       child: Column(
            //                         mainAxisSize: MainAxisSize.min,
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.start,
            //                         children: [
            //                           'Northampton Station'
            //                               .text500(14.kh, color: Colors.black),
            //                           8.kheightBox,
            //                           '541, Centric Centre near 51 Avenue metro station'
            //                               .text400(12.kh, color: Colors.black),
            //                         ],
            //                       ),
            //                     )
            //                   ],
            //                 ),
            //                 10.kheightBox,
            //                 Row(
            //                   children: [
            //                     CommonImageView(
            //                       svgPath: ImageConstant.svgLocationPin,
            //                       height: 16.kh,
            //                       width: 16.kh,
            //                     ),
            //                     8.kwidthBox,
            //                     '3.9 Km'.text500(10.kh),
            //                     16.kwidthBox,
            //                     CommonImageView(
            //                       svgPath: ImageConstant.svgClock,
            //                       height: 16.kh,
            //                       width: 16.kh,
            //                     ),
            //                     8.kwidthBox,
            //                     '12:00 am - 11:59 pm'.text500(10.kh),
            //                     const Spacer(),
            //                     EvStationRoundedBox(
            //                         borderRadius: 4.kh,
            //                         color: ColorUtil.labelGreen,
            //                         child: Padding(
            //                           padding: EdgeInsets.symmetric(
            //                               horizontal: 11.kw, vertical: 2.kh),
            //                           child: LocaleKeys.searched_open.tr
            //                               .text500(10.kh, color: Colors.white),
            //                         )),
            //                   ],
            //                 ),
            //                 8.kheightBox,
            //                 Row(
            //                   children: [
            //                     LocaleKeys.searched_available_connectors.tr
            //                         .text400(10.kh),
            //                     16.kwidthBox,
            //                     RichText(
            //                         text: TextSpan(children: [
            //                       TextSpan(
            //                           text: '7',
            //                           style: TextStyleUtil.genSans500(
            //                               fontSize: 10.kh,
            //                               color: ColorUtil.mainColor1)),
            //                       TextSpan(
            //                           text: '/7',
            //                           style: TextStyleUtil.genSans400(
            //                               fontSize: 10.kh,
            //                               color: Colors.black)),
            //                     ]))
            //                   ],
            //                 ),
            //               ],
            //             ),
            //           ),
            //           SingleChildScrollView(
            //             padding: EdgeInsets.symmetric(vertical: 16.kh),
            //             scrollDirection: Axis.horizontal,
            //             child: Row(
            //                 children: List.generate(
            //               controller.data.length,
            //               (index) => Row(
            //                 children: [
            //                   index == 0 ? 18.kwidthBox : Container(),
            //                   DecoratedBox(
            //                     decoration: BoxDecoration(
            //                       boxShadow: [
            //                         BoxShadow(
            //                             blurRadius: 5.kh,
            //                             spreadRadius: 5,
            //                             color: const Color(0xff767676)
            //                                 .withOpacity(0.08),
            //                             // color: Colors.black,
            //                             offset: const Offset(0, -2.5)),
            //                       ],
            //                     ),
            //                     child: EvStationRoundedBox(
            //                         child: Column(
            //                       children: [
            //                         Container(
            //                           padding: EdgeInsets.symmetric(
            //                               horizontal: 19.kw, vertical: 3.kh),
            //                           color: ColorUtil.labelGreen,
            //                           child: (controller.data[index]['label'] ??
            //                                   '')
            //                               .text400(8.kh, color: Colors.white),
            //                         ),
            //                         12.kheightBox,
            //                         Padding(
            //                           padding: 25.paddingHorizontal,
            //                           child: CommonImageView(
            //                             height: 24.kh,
            //                             width: 24.kh,
            //                             svgPath: controller.data[index]['logo'],
            //                           ),
            //                         ),
            //                         6.kheightBox,
            //                         (controller.data[index]['type'] ?? '')
            //                             .text500(8.kh),
            //                         7.kheightBox,
            //                       ],
            //                     )),
            //                   ),
            //                   16.kwidthBox
            //                 ],
            //               ),
            //             )),
            //           ),
            //         ],
            //       )),
            // ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20.kw, right: 20.kw, bottom: 75.kh),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: 10.paddingTop,
                    child: EvStationRoundedBox(
                        child: Padding(
                      padding:
                          paddingSymmetric(horizontal: 13.kw, vertical: 17.kh),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CommonImageView(
                                  imagePath: ImageConstant.pngDodgeCar2,
                                ),
                              ),
                              16.kwidthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  'Dodge Challenger'.text600(16.kh),
                                  4.kheightBox,
                                  'Supercharger'.text400(16.kh)
                                ],
                              )
                            ],
                          ),
                          16.kheightBox,
                          Row(
                            children: [
                              CommonImageView(
                                height: 20.kh,
                                width: 20.kh,
                                svgPath: ImageConstant.svgBolt,
                              ),
                              4.kwidthBox,
                              'Type - 2'.text500(12.kh,
                                  color: ColorUtil.mainDarkColor1),
                              const Spacer(),
                              CommonImageView(
                                height: 20.kh,
                                width: 20.kh,
                                svgPath: ImageConstant.svgBattery,
                              ),
                              4.kwidthBox,
                              '98%'.text500(12.kh,
                                  color: ColorUtil.mainDarkColor1),
                              const Spacer(),
                              CommonImageView(
                                height: 20.kh,
                                width: 20.kh,
                                svgPath: ImageConstant.svgRefuel,
                              ),
                              4.kwidthBox,
                              'DC'.text500(12.kh,
                                  color: ColorUtil.mainDarkColor1),
                              const Spacer(),
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
                          16.kheightBox,
                          LocaleKeys.trip_with_this_percentage.tr.text400(14.kh)
                        ],
                      ),
                    )),
                  ),
                  Positioned(
                    right: 5,
                    child: EvStationRoundedBox(
                        child: CommonImageView(
                      height: 20.kh,
                      width: 20.kh,
                      svgPath: ImageConstant.svgClose,
                    )),
                  )
                ],
              ),
            ),
            70.kheightBox
          ],
        ));
  }
}
