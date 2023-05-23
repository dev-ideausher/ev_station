import 'package:get/get.dart';

import '../controllers/trip_navigation_controller.dart';

class TripNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripNavigationController>(
      () => TripNavigationController(),
    );
  }
}
