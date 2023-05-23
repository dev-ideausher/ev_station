import 'package:ev_station/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySubscriptionController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;

  List<String> data = [
    LocaleKeys.my_subscription_free_unlimited_in.tr,
    LocaleKeys.my_subscription_share_your_charge.tr,
    LocaleKeys.my_subscription_optimized_media_centre.tr,
    LocaleKeys.my_subscription_earn_50_of.tr,
    LocaleKeys.my_subscription_earn_5_on.tr,
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
