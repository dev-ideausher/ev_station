import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/cars_controller.dart';

class CarsView extends GetView<CarsController> {
  const CarsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding: paddingOnly(left: 20.kw, right: 20.kw, bottom: 36.kh),
            child: EvStationButton(
              onPressed: () => Get.toNamed(Routes.ADD_NEW_CAR),
              label: LocaleKeys.cars_add_a_new_car.tr,
            ),
          ),
          body: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                60.kheightBox,
                LocaleKeys.cars_my_car.tr
                    .text600(20.kh, color: const Color(0xff077335)),
                15.kheightBox,
                DecoratedBox(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                        spreadRadius: 0,
                        color: Colors.black.withOpacity(0.15))
                  ]),
                  child: EvStationTextField(
                    prefixIcon: Padding(
                      padding:
                          paddingSymmetric(horizontal: 18.kw, vertical: 12.kh),
                      child: CommonImageView(
                        height: 24.kh,
                        width: 24.kh,
                        fit: BoxFit.contain,
                        svgColor: const Color(0xff616161),
                        svgPath: ImageConstant.svgSearch,
                      ),
                    ),
                    hint: LocaleKeys.common_search.tr,
                    textFillColor: Colors.white,
                  ),
                ),
                24.kheightBox,
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            EvStationRoundedBox(
                                color: ColorUtil.carElement,
                                child: Padding(
                                  padding: paddingSymmetric(
                                      horizontal: 20.kw, vertical: 13.kh),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      'Dodge Challenger'.text600(16.kh),
                                      4.kheightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          'Supercharger'.text400(14.kh),
                                          'GECG-01254'.text500(12.kh,
                                              color: ColorUtil.mainColor1),
                                        ],
                                      ),
                                      16.kheightBox,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CommonImageView(
                                                    height: 20.kh,
                                                    width: 20.kh,
                                                    svgPath:
                                                        ImageConstant.svgBolt,
                                                  ),
                                                  4.kwidthBox,
                                                  'Type - 2'.text500(12.kh,
                                                      color: ColorUtil
                                                          .mainDarkColor1)
                                                ],
                                              ),
                                              7.kheightBox,
                                              Row(
                                                children: [
                                                  CommonImageView(
                                                    height: 20.kh,
                                                    width: 20.kh,
                                                    svgPath:
                                                        ImageConstant.svgRefuel,
                                                  ),
                                                  4.kwidthBox,
                                                  'DC'.text500(12.kh,
                                                      color: ColorUtil
                                                          .mainDarkColor1)
                                                ],
                                              ),
                                              7.kheightBox,
                                              Row(
                                                children: [
                                                  CommonImageView(
                                                    height: 20.kh,
                                                    width: 20.kh,
                                                    svgPath:
                                                        ImageConstant.svgCharge,
                                                  ),
                                                  4.kwidthBox,
                                                  '24Kw'.text500(12.kh,
                                                      color: ColorUtil
                                                          .mainDarkColor1)
                                                ],
                                              ),
                                              7.kheightBox,
                                            ],
                                          ),
                                          CommonImageView(
                                            height: 75.kh,
                                            width: 154.kw,
                                            fit: BoxFit.contain,
                                            imagePath:
                                                ImageConstant.pngDodgeCar,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                            24.kheightBox
                          ],
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }
}
