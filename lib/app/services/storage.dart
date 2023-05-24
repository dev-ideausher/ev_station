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

  String get getuserId => _runData.read('userId');

  set setuserId(String val) => _runData.write('userId', val);

  String get getName => _runData.read('name');

  set setName(String val) => _runData.write('name', val);

  String get getProfileUrl => _runData.read('profileUrl');

  set setProfileUrl(String val) => _runData.write('profileUrl', val);

  String get getPhone => _runData.read('phone');

  set setPhone(String val) => _runData.write('phone', val);

  String get getEmail => _runData.read('email');

  set setEmail(String val) => _runData.write('email', val);

//

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
