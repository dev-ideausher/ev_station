import 'package:get/get.dart';

import '../controllers/searched_controller.dart';

class SearchedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchedController>(
      () => SearchedController(),
    );
  }
}
