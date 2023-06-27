import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListerNavigationController extends GetxController {
  PageController pageViewController = PageController();
  RxInt pageNo = 0.obs;

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

  onIconTap(int value) {
    pageNo.value = value;
    pageViewController.jumpToPage(pageNo.value);
  }
}
