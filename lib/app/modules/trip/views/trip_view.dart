import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/trip_controller.dart';

class TripView extends GetView<TripController> {
  const TripView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.isSelecting.value = false;
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: paddingOnly(left: 20.kw, right: 20.kw, top: 60.kh),
              child: Obx(
                () => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                        visible: controller.isSelecting.value,
                        child: Padding(
                          padding: paddingOnly(right: 18.kw),
                          child: GestureDetector(
                            onTap: () => controller.isSelecting.value = false,
                            child: CommonImageView(
                              height: 30.kh,
                              width: 30.kh,
                              svgPath: ImageConstant.svgRoundedBack,
                            ),
                          ),
                        )),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          EvStationTextField(
                            radius: 8.kh,
                            borderWidth: 1.kh,
                            borderColor: ColorUtil.labelGreen,
                            isBorder: true,
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
                          ),
                          12.kheightBox,
                          EvStationTextField(
                            radius: 8.kh,
                            borderWidth: 1.kh,
                            borderColor: ColorUtil.labelGreen,
                            isBorder: true,
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
                          ),
                          17.kheightBox
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.red[100],
                  ),
                  controller.isSelecting.value
                      ? Container(
                          color: Colors.white,
                          padding: 20.paddingHorizontal,
                          child: ListView.builder(
                              padding: paddingOnly(),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      onTap: () =>
                                          controller.onStationTap(index),
                                      title:
                                          'Northampton Station'.text500(14.kh),
                                      leading: CommonImageView(
                                        height: 30.kh,
                                        width: 30.kh,
                                        svgPath: ImageConstant.svgPointOnMap,
                                      ),
                                      subtitle:
                                          '541, Centric Centre near 51 Avenue metro station'
                                              .text400(12.kh),
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    Divider(
                                      thickness: 0.5.kh,
                                    )
                                  ],
                                );
                              }),
                        )
                      : Container()
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
