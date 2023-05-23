import 'package:get/get.dart';

import '../controllers/book_slot_controller.dart';

class BookSlotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookSlotController>(
      () => BookSlotController(),
    );
  }
}
