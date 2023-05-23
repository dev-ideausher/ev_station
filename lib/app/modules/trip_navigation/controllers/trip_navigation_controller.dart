import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class TripNavigationController extends GetxController {
  TextEditingController yourLocationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  List<Map<String, String>> data = [
    {'label': 'Charger A', 'logo': ImageConstant.svgCcs2, 'type': 'CCS-2'},
    {
      'label': 'Charger B',
      'logo': ImageConstant.svgAcType2,
      'type': 'AC Type-2'
    },
    {'label': 'Charger C', 'logo': ImageConstant.svgDc001, 'type': 'DC001'},
    {'label': 'Charger D', 'logo': ImageConstant.svgDc001, 'type': 'DC001'},
  ];

  @override
  void onInit() {
    super.onInit();
    yourLocationController.text = 'Place A';
    destinationController.text = 'Place B';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onTextfieldTap() {}

  onStationTap() {
    Get.toNamed(Routes.STATION_DETAIL);
  }

  onOptionTap() {
    Get.bottomSheet(
        Container(
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
                  children: [
                    14.kheightBox,
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
                    38.kheightBox,
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      leading: CommonImageView(
                        height: 30.kh,
                        width: 30.kh,
                        svgPath: ImageConstant.svgLocation2,
                      ),
                      title: LocaleKeys.trip_add_another_stop.tr.text500(18.kh),
                    ),
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      leading: CommonImageView(
                        height: 30.kh,
                        width: 30.kh,
                        svgPath: ImageConstant.svgNavigation,
                      ),
                      title: LocaleKeys.trip_share_directions.tr.text500(18.kh),
                    ),
                    ListTile(
                      onTap: () {},
                      contentPadding: EdgeInsets.zero,
                      leading: CommonImageView(
                        height: 30.kh,
                        width: 30.kh,
                        svgColor: ColorUtil.mainColor1,
                        svgPath: ImageConstant.svgTripOn,
                      ),
                      title: LocaleKeys.trip_add_route.tr.text500(18.kh),
                    ),
                    62.kheightBox
                  ],
                ))),
        isScrollControlled: true);
  }
}
