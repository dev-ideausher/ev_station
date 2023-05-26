import 'package:ev_station/app/modules/profile/views/settings.dart';
import 'package:ev_station/app/routes/app_pages.dart';
import 'package:ev_station/app/services/auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
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

  onProfileDetailsTap() async {
    bool success = await Get.toNamed(Routes.PROFILE_DETAIL);
    success ? update() : null;
  }

  onMyBookingsTap() {
    Get.toNamed(Routes.MY_BOOKINGS);
  }

  onMySubscriptionTap() {
    Get.toNamed(Routes.MY_SUBSCRIPTION);
    // Get.to(() => SubscriptionSuccessful());
  }

  onLogoutTap() {
    Get.find<AuthService>().logOutUser();
  }

  onSettingsTap() {
    Get.to(() => const Settings());
  }

  onNotificationTap() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  onCardPaymentTap() {
    Get.toNamed(Routes.CARD_PAYMENT);
  }
}
