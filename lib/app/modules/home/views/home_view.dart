import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                62.kheightBox,
                Row(
                  children: [
                    Expanded(
                      child: LocaleKeys.home_choose_ev.tr
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
                Hero(
                  tag: 'search',
                  child: Material(
                    child: EvStationTextField(
                      readOnly: true,
                      onTap: () => controller.onSearchTap(),
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
                  ),
                ),
                24.kheightBox,
                LocaleKeys.home_near_me.tr.text500(20.kh, color: Colors.black),
                // 10.kheightBox,
              ],
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 12.kh),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(3, (index) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    index == 0 ? 20.kwidthBox : Container(),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              color: const Color(0xff707070).withOpacity(0.1),
                              // color: Colors.black,
                              offset: const Offset(0, -2)),
                        ],
                      ),
                      child: EvStationRoundedBox(
                          width: 295.kw,
                          color: const Color(0xffF6F6F6),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.kw, vertical: 12.kh),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    EvStationRoundedBox(
                                        color: Colors.black12,
                                        borderRadius: 4.kh,
                                        child: SizedBox(
                                          height: 56.kh,
                                          width: 56.kh,
                                        )),
                                    12.kwidthBox,
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min, 
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          'Northampton Station'.text500(14.kh,
                                              color: Colors.black),
                                          5.kheightBox,
                                          '541, Centric Centre near 51 Avenue metro station'
                                              .text400(12.kh,
                                                  color: Colors.black),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                15.kheightBox,
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: List.generate(
                                      controller.data.length,
                                      (index) => Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CommonImageView(
                                                    height: 20.kh,
                                                    width: 20.kh,
                                                    svgPath: controller
                                                        .data[index]['icon'],
                                                  ),
                                                  (controller.data[index]
                                                              ['label'] ??
                                                          '')
                                                      .text500(12.kh,
                                                          color: ColorUtil
                                                              .mainDarkColor1)
                                                ],
                                              ),
                                              index != 2
                                                  ? 40.kwidthBox
                                                  : Container()
                                            ],
                                          )),
                                )
                              ],
                            ),
                          )),
                    ),
                    20.kwidthBox
                  ],
                );
              }),
            ),
          ),
          Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                18.kheightBox,
                LocaleKeys.home_look_out_on.tr
                    .text500(20.kh, color: Colors.black),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
// static const String