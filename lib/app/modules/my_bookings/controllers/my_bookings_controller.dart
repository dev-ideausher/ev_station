import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBookingsController extends GetxController
    with GetTickerProviderStateMixin {
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
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
