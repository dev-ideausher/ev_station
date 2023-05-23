import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'enigma.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  // we are utilisig encrypt class we decrypt once we read and encrypt before write.

  bool get getIsLoggedIn => _runData.read('isLogIn') ?? false;

  set setIsLoggedIn(bool val) => _runData.write('isLogIn', val);

  String get getEncjwToken =>
      decryptAESCryptoJS(_runData.read('jwToken')) ?? '';

  set setEncjwToken(String val) =>
      _runData.write('jwToken', encryptAESCryptoJS(val));

  void logout() {
    _runData.erase();
  }
}
