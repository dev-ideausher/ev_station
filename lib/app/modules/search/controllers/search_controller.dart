import 'package:ev_station/app/services/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SearchingController extends GetxController {
  List<String> label = ['GoCharge', 'Ather Grid', 'Studio', 'Ola'];
  List<String> connectorLabel = [
    'AC Type - 2',
    '15 A',
    'AC - 001',
    'Studios',
    '16 A'
  ];

  RxInt radioValue = 0.obs;

  List<String> chargerLabel = [
    LocaleKeys.search_available_chargers_only.tr,
    LocaleKeys.search_free_chargers_only.tr,
    LocaleKeys.search_price_low_to_high.tr,
    LocaleKeys.search_price_high_to_low.tr,
    LocaleKeys.search_discount.tr,
  ];

  RxList<bool> labelBool = [
    false,
    false,
    false,
    false,
  ].obs;
  RxList<bool> connectorBool = [
    false,
    false,
    false,
    false,
    false,
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onFilterTap() {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: 630.kh,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.kh),
              topRight: Radius.circular(24.kh),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: 20.paddingHorizontal,
                child: Column(
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
                    16.kheightBox,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LocaleKeys.search_filter.tr
                                .text500(20.kh, color: Colors.black),
                            24.kheightBox,
                            LocaleKeys.search_brand.tr
                                .text500(16.kh, color: Colors.black),
                            16.kheightBox,
                            Obx(
                              () => Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: List.generate(
                                    labelBool.length,
                                    (index) => EvStationRoundedBox(
                                        color: labelBool[index] == false
                                            ? Colors.white
                                            : ColorUtil.labelGreen,
                                        onTap: () => onBrandTap(index),
                                        borderWidth: 0.5.kh,
                                        borderRadius: 4.kh,
                                        isBorder: true,
                                        borderColor: labelBool[index] == false
                                            ? const Color(0xff4A4A4A)
                                            : ColorUtil.kGreen04,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.kw,
                                              vertical: 5.kh),
                                          child: label[index].text500(12.kh,
                                              color: labelBool[index] == false
                                                  ? const Color(0xff4A5569)
                                                  : Colors.white),
                                        ))),
                              ),
                            ),
                            30.kheightBox,
                            EvStationRoundedBox(
                                borderWidth: 0.4.kh,
                                isBorder: true,
                                borderColor: Colors.black,
                                child: Padding(
                                  padding: 20.paddingHorizontal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      16.kheightBox,
                                      LocaleKeys.search_charger_type.tr
                                          .text500(16.kh),
                                      16.kheightBox,
                                      Obx(
                                        () => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(
                                              chargerLabel.length,
                                              (index) => RadioListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    title: chargerLabel[index]
                                                        .text400(14.kh),
                                                    value: index,
                                                    groupValue:
                                                        radioValue.value,
                                                    onChanged: (value) =>
                                                        onRadioTap(value),
                                                  )),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            24.kheightBox,
                            LocaleKeys.search_connector_type.tr.text500(16.kh),
                            16.kheightBox,
                            Obx(
                              () => Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: List.generate(
                                    connectorBool.length,
                                    (index) => EvStationRoundedBox(
                                        color: connectorBool[index] == false
                                            ? Colors.white
                                            : ColorUtil.labelGreen,
                                        onTap: () => onConnectorTypeTap(index),
                                        borderWidth: 0.5.kh,
                                        borderRadius: 4.kh,
                                        isBorder: true,
                                        borderColor:
                                            connectorBool[index] == false
                                                ? const Color(0xff4A4A4A)
                                                : ColorUtil.kGreen04,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 13.kw,
                                              vertical: 5.kh),
                                          child: connectorLabel[index].text500(
                                              12.kh,
                                              color:
                                                  connectorBool[index] == false
                                                      ? const Color(0xff4A5569)
                                                      : Colors.white),
                                        ))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(thickness: 1.kh),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.kh, horizontal: 20.kh),
              child: Row(
                children: [
                  Expanded(
                    child: EvStationButton(
                      onPressed: () => Get.back(),
                      isActive: false,
                      label: LocaleKeys.common_cancel.tr,
                    ),
                  ),
                  24.kwidthBox,
                  Expanded(
                    child: EvStationButton(
                      onPressed: () {},
                      label: LocaleKeys.common_apply.tr,
                    ),
                  ),
                ],
              ),
            ),
            34.kheightBox
          ],
        ),
      ),
    );
  }

  onBrandTap(int index) {
    for (var i = 0; i < labelBool.length; i++) {
      labelBool[i] = false;
    }
    labelBool[index] = true;
  }

  onRadioTap(value) {
    radioValue.value = value;
  }

  onConnectorTypeTap(int index) {
    for (var i = 0; i < connectorBool.length; i++) {
      connectorBool[i] = false;
    }
    connectorBool[index] = true;
  }

  onStationTap(int index) {
    Get.toNamed(Routes.SEARCHED);
  }
}
