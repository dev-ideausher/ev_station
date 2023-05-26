import 'package:ev_station/app/modules/card_payment/views/add_a_new_card.dart';
import 'package:get/get.dart';

class CardPaymentController extends GetxController {
  RxBool isCheck = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  onAddNewCardTap() {
    Get.to(() => AddNewCard());
  }
}
