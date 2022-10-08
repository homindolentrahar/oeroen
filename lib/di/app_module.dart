import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AppModule {
  static void inject() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);
    Get.put<GoogleSignIn>(GoogleSignIn.standard(), permanent: true);

    //  Inject modules
    AppModule.inject();
  }
}
