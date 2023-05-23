import 'package:ev_station/app/modules/cars/controllers/cars_controller.dart';
import 'package:ev_station/app/modules/home/controllers/home_controller.dart';
import 'package:ev_station/app/modules/profile/controllers/profile_controller.dart';
import 'package:ev_station/app/modules/trip/controllers/trip_controller.dart';
import 'package:get/get.dart';

import '../controllers/renter_navigation_controller.dart';

class RenterNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RenterNavigationController>(
      () => RenterNavigationController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CarsController>(
      () => CarsController(),
    );
    Get.lazyPut<TripController>(
      () => TripController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
