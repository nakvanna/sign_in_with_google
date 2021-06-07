import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_google/app/routes/app_pages.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late GoogleSignIn _googleSignIn;

  get isNotLogin => _auth.currentUser.isNull;

  ///Check if login or not
  @override
  void onInit() {
    _googleSignIn = GoogleSignIn();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _googleSignIn.disconnect();
  }

  Future<void> googleSignIn() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, UserCredential Sign-in
    await _auth.signInWithCredential(credential);
    Get.offAllNamed(Routes.HOME);
  }

  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Get.offAllNamed(Routes.HOME);
    } catch (error) {
      Get.snackbar('Google sign-out error', '$error');
    }
  }
}
