import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/determine_location.dart';

class HomeController extends GetxController {
  List<Map<String, String>> data = [
    {'icon': ImageConstant.svgBolt, 'label': 'Type - 2'},
    {'icon': ImageConstant.svgRefuel, 'label': '10Kw/h'},
    {'icon': ImageConstant.svgDollar, 'label': '\$2.51 / Kw'},
  ];
  @override
  void onInit() {
    super.onInit();
    setLocation();
  }

  setLocation() async {
    await DetermineLocation.determinePosition();
  }

  @override
  void onReady() {
    super.onReady();
    // onLocationPermission();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onSearchTap() {
    Get.toNamed(Routes.SEARCH);
  }

  onLocationPermission() {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
          // height: 360.kh,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.kh),
                topRight: Radius.circular(24.kh),
              )),
          child: Padding(
            padding: 20.paddingHorizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                20.kheightBox,
                Align(
                  alignment: Alignment.center,
                  child: EvStationRoundedBox(
                    borderRadius: 5.kh,
                    height: 5.kh,
                    width: 50.kw,
                    color: const Color(0xff999999),
                    child: Container(),
                  ),
                ),
                37.kheightBox,
                LocaleKeys.home_turn_on_your_location.tr.text600(20.kh,
                    color: ColorUtil.mainDarkColor1,
                    textAlign: TextAlign.center),
                24.kheightBox,
                CommonImageView(
                  fit: BoxFit.contain,
                  svgPath: ImageConstant.svgLocationArt,
                ),
                35.kheightBox,
                LocaleKeys.home_please_turn_on.tr.text400(14.kh),
                45.kheightBox,
                const Divider(),
                6.kheightBox,
                EvStationButton(
                  onPressed: () => Get.back(),
                  label: LocaleKeys.home_enable_location.tr,
                ),
                43.kheightBox,
              ],
            ),
          )),
    );
  }
}
