import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_google/app/routes/app_pages.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  @override
  void onInit() {
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      print(account);
    });
    _googleSignIn.signInSilently();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignIn = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleSignIn!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      print('After process $googleSignIn');
      await _auth
          .signInWithCredential(credential)
          .then((value) => Get.offAllNamed(Routes.HOME));
    } catch (error) {
      print(error);
      Get.snackbar('Google sign-in error', '$error');
    }
  }

  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (error) {
      Get.snackbar('Google sign-out error', '$error');
    }
  }
}
