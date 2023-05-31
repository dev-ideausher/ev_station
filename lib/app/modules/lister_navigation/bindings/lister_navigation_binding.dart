import 'package:get/get.dart';

import '../controllers/lister_navigation_controller.dart';

class ListerNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListerNavigationController>(
      () => ListerNavigationController(),
    );
  }
}
