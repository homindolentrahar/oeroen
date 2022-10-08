import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oeroen/features/auth/data/repositories/auth_repository.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

abstract class AuthModule {
  static void inject() {
    Get.put<IAuthRepository>(
      AuthRepository(
        auth: Get.find<FirebaseAuth>(),
        googleSignIn: Get.find<GoogleSignIn>(),
        firestore: Get.find<FirebaseFirestore>(),
      ),
      permanent: true,
    );
  }
}
