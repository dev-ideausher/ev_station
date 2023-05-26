import 'package:ev_station/app/routes/app_pages.dart';
import 'package:ev_station/app/services/index.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StationDetailController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;

  RxString type = 'Open'.obs;

  RxBool isSwitch = false.obs;
  RxBool isAlert = false.obs;

  List<double> percent = [
    1.0,
    0.75,
    0.5,
    0.25,
    0.1,
  ];

  double rating = 2;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController!.addListener(handleTabSection);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void handleTabSection() {
    if (tabController!.indexIsChanging) {
      update();
    }
  }

  onBookASlotTap() {
    Get.toNamed(Routes.BOOK_SLOT);
  }

  onSetRemoveAlertTap() {
    isAlert.value == true ? onRemoveAlert() : onSetAlert();
  }

  onSetAlert() {
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
                33.kheightBox,
                LocaleKeys.station_detail_set_alert.tr.text500(20.kh),
                16.kheightBox,
                LocaleKeys.station_detail_you_will_be.tr.text400(16.kh),
                24.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LocaleKeys.station_detail_set_alert.tr.text500(16.kh),
                    Obx(
                      () => Switch(
                        activeColor: ColorUtil.labelGreen,
                        value: isSwitch.value,
                        onChanged: (value) => isSwitch.value = value,
                      ),
                    )
                  ],
                ),
                28.kheightBox,
                const Divider(),
                6.kheightBox,
                EvStationButton(
                  onPressed: () {
                    isAlert.value = true;
                    Get.back();
                  },
                  label: LocaleKeys.common_confirm.tr,
                ),
                43.kheightBox,
              ],
            ),
          )),
    );
  }

  onRemoveAlert() {
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
                35.kheightBox,
                LocaleKeys.station_detail_alert_has_been.tr
                    .text500(20.kh, textAlign: TextAlign.center),
                16.kheightBox,
                LocaleKeys.station_detail_go_back_to.tr
                    .text400(16.kh, textAlign: TextAlign.center),
                34.kheightBox,
                const Divider(),
                6.kheightBox,
                EvStationButton(
                  onPressed: () {
                    isAlert.value = false;
                    Get.back();
                  },
                  label: LocaleKeys.otp_verification_scontinue.tr,
                ),
                43.kheightBox,
              ],
            ),
          )),
    );
  }

  onAddCommentTap() {
    Get.toNamed(Routes.ADD_COMMENT);
  }
}
