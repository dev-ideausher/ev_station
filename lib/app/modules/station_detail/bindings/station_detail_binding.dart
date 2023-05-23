import 'package:get/get.dart';

import '../controllers/station_detail_controller.dart';

class StationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StationDetailController>(
      () => StationDetailController(),
    );
  }
}
