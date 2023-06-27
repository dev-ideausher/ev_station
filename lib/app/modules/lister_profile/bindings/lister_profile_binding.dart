import 'package:get/get.dart';

import '../controllers/lister_profile_controller.dart';

class ListerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListerProfileController>(
      () => ListerProfileController(),
    );
  }
}
