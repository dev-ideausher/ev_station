import 'package:ev_station/app/modules/lister_home/controllers/lister_home_controller.dart';
import 'package:ev_station/app/modules/lister_profile/controllers/lister_profile_controller.dart';
import 'package:ev_station/app/modules/my_chargers/controllers/my_chargers_controller.dart';
import 'package:get/get.dart';

import '../controllers/lister_navigation_controller.dart';

class ListerNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListerNavigationController>(
      () => ListerNavigationController(),
    );
    Get.lazyPut<ListerHomeController>(
      () => ListerHomeController(),
    );
    Get.lazyPut<MyChargersController>(
      () => MyChargersController(),
    );
    Get.lazyPut<ListerProfileController>(
      () => ListerProfileController(),
    );
  }
}
