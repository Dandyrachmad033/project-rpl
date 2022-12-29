import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rpl/home.dart';
import 'package:rpl/main.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String emailUser = '';
  bool checkLogin = true;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential userC = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      emailUser = userC.user!.email!;

      Get.offAll(Home());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        checkLogin = false;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        checkLogin = false;
      }
      update();
    }
  }

  void logOut() async {
    await auth.signOut();
    Get.offAll(MyApp());
  }
}
