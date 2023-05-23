import 'package:ev_station/app/modules/make_payment/views/payment_successful.dart';
import 'package:ev_station/app/services/index.dart';
import 'package:get/get.dart';

class MakePaymentController extends GetxController {
  List<String> cards = [
    ImageConstant.svgVisa,
    ImageConstant.svgAmex,
    ImageConstant.svgStripe,
  ];

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

  onConfirmSlotTap() {
    Get.to(() => PaymentSuccessful());
  }
}
