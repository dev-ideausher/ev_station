import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import '../routes/app_pages.dart';
import 'dialog_helper.dart';
import 'storage.dart';
import 'dart:developer';

class AuthService extends GetxService {
  final auth = FirebaseAuthenticationService();
  // final _facebookLogin = FacebookAuth.instance;
  // AuthCredential? _pendingCredential;
  final _firebaseAuth = FirebaseAuth.instance;

  google() async {
    //TODO: do the required setup mentioned in https://pub.dev/packages/google_sign_in
    final result = await auth.signInWithGoogle().then((value) async {
      await handleGetContact();
    });

    print('Google : ${await result.user?.getIdToken()}');
  }

  apple() async {
    final result = await auth
        .signInWithApple(
            //TODO: add your own handler id from firebase console
            appleRedirectUri:
                'https://stacked-firebase-auth-test.firebaseapp.com/__/auth/handler',
            appleClientId: '')
        .then((value) async {
      await handleGetContact();
    });
    print('Apple : ${await result.user?.getIdToken()}');
  }

  Future<bool> loginEmailPass(
      {required String email, required String pass}) async {
    final result = await auth.loginWithEmail(email: email, password: pass);
    if (result.hasError) {
      return false;
    } else {
      await handleGetContact();
      return true;
    }
  }

  Future<bool> createEmailPass(
      {required String email, required String pass}) async {
    final result =
        await auth.createAccountWithEmail(email: email, password: pass);
    if (result.hasError) {
      return false;
    } else {
      await handleGetContact();
      return true;
    }
  }

//phone number with country code
  Future mobileOtp({required String phoneno}) async {
    await auth.requestVerificationCode(
      onVerificationCompleted: (authenticationResult) =>
          print('ha ye karlo pehle'),
      phoneNumber: phoneno,
      onCodeSent: (verificationId) => print(verificationId),
    );
  }

  Future<bool> verifyMobileOtp({required String otp}) async {
    final result = await auth.authenticateWithOtp(otp);
    // .then((value) async {
    //   await handleGetContact();
    // });
    if (result.hasError) {
      return false;
    } else {
      await handleGetContact();
      return true;
    }
  }

  // facebook() async {
  //   //TODO: do the required setup mentioned in https://pub.dev/packages/flutter_facebook_auth
  //   final result = await signInWithFacebook().then((value) async {
  //     await handleGetContact();
  //   });
  //   print('Facebook : ${await result.user?.getIdToken()}');
  // }

  // Future<FirebaseAuthenticationResult> signInWithFacebook() async {
  //   try {
  //     LoginResult fbLogin = await _facebookLogin.login();
  //     // log?.v('Facebook Sign In complete. \naccessToken:${accessToken.token}');

  //     final OAuthCredential facebookCredentials =
  //         FacebookAuthProvider.credential(fbLogin.accessToken!.token);

  //     var result =
  //         await _firebaseAuth.signInWithCredential(facebookCredentials);

  //     // Link the pending credential with the existing account
  //     if (_pendingCredential != null) {
  //       await result.user?.linkWithCredential(_pendingCredential!);
  //     }

  //     return FirebaseAuthenticationResult(user: result.user);
  //   } catch (e) {
  //     // log?.e(e);
  //     return FirebaseAuthenticationResult.error(errorMessage: e.toString());
  //   }
  // }

  Future<void> handleGetContact() async {
    final mytoken = await _firebaseAuth.currentUser!.getIdToken(true);
    // final fireUid = _firebaseAuth.currentUser!.uid;

    Get.find<GetStorageService>().setEncjwToken = mytoken;
    // Get.find<GetStorageService>().setFirebaseUid = fireUid;
    log(Get.find<GetStorageService>().getEncjwToken);
    // debugPrint('i am user id${Get.find<GetStorageService>().getFirebaseUid}');
  }

  Future<void> logOutUser() async {
    DialogHelper.showLoading();
    // erase the user's token and data in GetStorageService
    Get.find<GetStorageService>().logout();
    // firbase logout
    await auth.logout();
    // navigate to login page
    await Get.offAllNamed(Routes.ONBOARDING);
    await DialogHelper.hideDialog();
  }
}
