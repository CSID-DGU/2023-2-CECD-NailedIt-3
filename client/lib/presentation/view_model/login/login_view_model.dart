import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nailed_it/domain/repository/user_repository.dart';
import 'package:nailed_it/domain/usecase/login_with_google_use_case.dart';

class LoginViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final LoginWithGoogleUseCase _loginWithGoogleUseCase;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isEnableGreyBarrier;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  @override
  void onInit() {
    super.onInit();

    _loginWithGoogleUseCase = LoginWithGoogleUseCase(
      userRepository: Get.find<UserRepository>(),
    );

    _isEnableGreyBarrier = false.obs;
  }

  Future<bool> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return false;
    }

    _isEnableGreyBarrier.value = true;
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    try {
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      // Login with Google
    } catch (e) {
      _isEnableGreyBarrier.value = false;
      return false;
    }

    // Check User
    bool result = await _loginWithGoogleUseCase.execute();

    _isEnableGreyBarrier.value = false;
    return result;
  }
}
