import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class BookSlotController extends GetxController {
  RxString dropDownValue = '0'.obs;
  RxString date = DateTime.now().toString().split(' ')[0].obs;
  RxString time = TimeOfDay.now().format(Get.context!).obs;

  RxInt curPage = 0.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PageController pageViewController = PageController();

  List<DropdownMenuItem<String>> dropdownItems = [
    const DropdownMenuItem(value: "0", child: Text("Select a Task")),
    const DropdownMenuItem(value: "1", child: Text("Select a Task 2")),
  ];

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

  onDropDownTap(value) {
    dropDownValue.value = value;
  }

  onDate() {
    showDatePicker(
            context: Get.context!,
            initialDate: DateTime.now(),
            firstDate: DateTime(1969),
            lastDate: DateTime(2069))
        .then((value) => date.value = value?.toString().split(' ')[0] ??
            DateTime.now().toString().split(' ')[0]);
  }

  onTime() {
    showTimePicker(
      initialTime: TimeOfDay.now(),
      context: Get.context!,
    ).then((value) => time.value =
        value?.format(Get.context!) ?? TimeOfDay.now().format(Get.context!));
  }

  onSubmitTap() {
    pageViewController.jumpToPage(1);
    curPage.value = 1;
  }

  onBackTap() {
    if (curPage.value == 1) {
      pageViewController.jumpToPage(0);
      curPage.value = 0;
    } else {
      Get.back();
    }
  }

  onConfirmSlot() {
    Get.toNamed(Routes.MAKE_PAYMENT);
  }

  onApplyCouponTap() {
    Get.toNamed(Routes.COUPON);
  }
}
