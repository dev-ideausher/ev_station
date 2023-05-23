import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class TripController extends GetxController with GetTickerProviderStateMixin {
  RxBool isSelecting = false.obs;

  late Rx<AnimationController> animate = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  ).obs;

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

  onTextfieldTap() {
    isSelecting.toggle();
  }

  onStationTap(int index) {
    Get.toNamed(Routes.TRIP_NAVIGATION);
  }
}
