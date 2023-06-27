import 'package:get/get.dart';

import '../controllers/lister_home_controller.dart';

class ListerHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListerHomeController>(
      () => ListerHomeController(),
    );
  }
}
