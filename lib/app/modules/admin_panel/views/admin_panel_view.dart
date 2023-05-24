import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/colors.dart';
import '../../../services/storage.dart';
import '../controllers/admin_panel_controller.dart';
import 'admin_panel_button.dart';

class AdminPanelView extends GetView<AdminPanelController> {
  const AdminPanelView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AdminPanelView'),
          centerTitle: true,
          backgroundColor: ColorUtil.mainColor1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AdminPanelButton(
                  label: 'Onboarding',
                  onPressed: () => Get.toNamed(Routes.ONBOARDING,
                      parameters: {'isLogin': 'true'}),
                ),
                AdminPanelButton(
                  label: 'Navigation',
                  onPressed: () => Get.toNamed(Routes.RENTER_NAVIGATION),
                ),
                AdminPanelButton(
                  label: 'Station Detail',
                  onPressed: () => Get.toNamed(Routes.STATION_DETAIL),
                ),
                AdminPanelButton(
                  label: 'Book a Slot',
                  onPressed: () => Get.toNamed(Routes.BOOK_SLOT),
                ),
                AdminPanelButton(
                  label: 'Print Token',
                  onPressed: () =>
                      log(Get.find<GetStorageService>().getEncjwToken),
                ),
                AdminPanelButton(
                  label: 'uid',
                  onPressed: () => log(Get.find<GetStorageService>().getuserId),
                ),
              ],
            ),
          ),
        ));
  }
}
