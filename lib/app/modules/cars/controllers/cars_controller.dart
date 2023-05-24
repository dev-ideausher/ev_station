import 'package:ev_station/app/services/dio/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/get_all_cars_model.dart';
import '../../../routes/app_pages.dart';

class CarsController extends GetxController {
  RxList<Cars> cars = <Cars>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllCarsAPI();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getAllCarsAPI() async {
    try {
      await APIManager.getAllCarsAPI().then((value) => value.data['status']
          ? cars.value = GetAllCars.fromJson(value.data).cars ?? []
          : null);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  onAddNewCarTap() async {
    bool refresh = await Get.toNamed(Routes.ADD_NEW_CAR);
    refresh ? await getAllCarsAPI() : null;
  }
}
