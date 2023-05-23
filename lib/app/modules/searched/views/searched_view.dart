import 'package:ev_station/app/components/ev_station_rounded_box.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../services/index.dart';
import '../controllers/searched_controller.dart';

class SearchedView extends GetView<SearchedController> {
  const SearchedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                color: Colors.red[100],
              ),
              Padding(
                padding: 20.paddingAll,
                child: Column(
                  children: [
                    70.kheightBox,
                    EvStationTextField(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 18.kw, right: 21.kw),
                        child: CommonImageView(
                          fit: BoxFit.contain,
                          svgPath: ImageConstant.svgSearch,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: 21.paddingRight,
                        child: GestureDetector(
                          onTap: () {
                            ///TODO
                          },
                          child: CommonImageView(
                            height: 24.kh,
                            width: 24.kh,
                            svgPath: ImageConstant.svgMicrophone,
                          ),
                        ),
                      ),
                      hintStyle: TextStyleUtil.genSans500(
                          fontSize: 14.kh, color: const Color(0xffa1a1a1)),
                      hint: LocaleKeys.home_search_for_a.tr,
                      textFillColor: const Color(0xffEFEFEF),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 20.kw, right: 20.kw, bottom: 75.kh),
                  child: EvStationRoundedBox(
                      onTap: () => controller.onStationTap(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: 18.paddingHorizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                23.kheightBox,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    EvStationRoundedBox(
                                        color: Colors.black12,
                                        borderRadius: 4.kh,
                                        child: SizedBox(
                                          height: 78.kh,
                                          width: 82.kw,
                                        )),
                                    16.kwidthBox,
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          'Northampton Station'.text500(14.kh,
                                              color: Colors.black),
                                          8.kheightBox,
                                          '541, Centric Centre near 51 Avenue metro station'
                                              .text400(12.kh,
                                                  color: Colors.black),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                10.kheightBox,
                                Row(
                                  children: [
                                    CommonImageView(
                                      svgPath: ImageConstant.svgLocationPin,
                                      height: 16.kh,
                                      width: 16.kh,
                                    ),
                                    8.kwidthBox,
                                    '3.9 Km'.text500(10.kh),
                                    16.kwidthBox,
                                    CommonImageView(
                                      svgPath: ImageConstant.svgClock,
                                      height: 16.kh,
                                      width: 16.kh,
                                    ),
                                    8.kwidthBox,
                                    '12:00 am - 11:59 pm'.text500(10.kh),
                                    const Spacer(),
                                    EvStationRoundedBox(
                                        borderRadius: 4.kh,
                                        color: ColorUtil.labelGreen,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 11.kw,
                                              vertical: 2.kh),
                                          child: LocaleKeys.searched_open.tr
                                              .text500(10.kh,
                                                  color: Colors.white),
                                        )),
                                  ],
                                ),
                                8.kheightBox,
                                Row(
                                  children: [
                                    LocaleKeys.searched_available_connectors.tr
                                        .text400(10.kh),
                                    16.kwidthBox,
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: '7',
                                          style: TextStyleUtil.genSans500(
                                              fontSize: 10.kh,
                                              color: ColorUtil.mainColor1)),
                                      TextSpan(
                                          text: '/7',
                                          style: TextStyleUtil.genSans400(
                                              fontSize: 10.kh,
                                              color: Colors.black)),
                                    ]))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            padding: EdgeInsets.symmetric(vertical: 16.kh),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: List.generate(
                              controller.data.length,
                              (index) => Row(
                                children: [
                                  index == 0 ? 18.kwidthBox : Container(),
                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5.kh,
                                            spreadRadius: 5,
                                            color: const Color(0xff767676)
                                                .withOpacity(0.08),
                                            // color: Colors.black,
                                            offset: const Offset(0, -2.5)),
                                      ],
                                    ),
                                    child: EvStationRoundedBox(
                                        child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 19.kw,
                                              vertical: 3.kh),
                                          color: ColorUtil.labelGreen,
                                          child: (controller.data[index]
                                                      ['label'] ??
                                                  '')
                                              .text400(8.kh,
                                                  color: Colors.white),
                                        ),
                                        12.kheightBox,
                                        Padding(
                                          padding: 25.paddingHorizontal,
                                          child: CommonImageView(
                                            height: 24.kh,
                                            width: 24.kh,
                                            svgPath: controller.data[index]
                                                ['logo'],
                                          ),
                                        ),
                                        6.kheightBox,
                                        (controller.data[index]['type'] ?? '')
                                            .text500(8.kh),
                                        7.kheightBox,
                                      ],
                                    )),
                                  ),
                                  16.kwidthBox
                                ],
                              ),
                            )),
                          ),
                        ],
                      )),
                ),
              )
            ],
          )),
    );
  }
}
