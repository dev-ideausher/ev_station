import 'package:ev_station/app/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RenterNavigationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  PageController pageViewController = PageController();
  RxInt pageNo = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.find<GetStorageService>().setIsLoggedIn = true;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onIconTap(int value) {
    pageNo.value = value;
    pageViewController.jumpToPage(pageNo.value);
  }
}
