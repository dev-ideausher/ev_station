import 'package:get/get_rx/src/rx_types/rx_types.dart';

class UserModel {
  RxString username = ''.obs;
  RxString profileURL = ''.obs;
  RxString email = ''.obs;
  RxString number = ''.obs;

  // UserModel(this.);

  dispose() {
    username.value = '';
    profileURL.value = '';
    email.value = '';
    number.value = '';
  }
}
