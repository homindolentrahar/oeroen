import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oeroen/features/auth/data/repositories/auth_repository.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';
import 'package:oeroen/features/iuran/data/repositories/iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuth>(FirebaseAuth.instance, permanent: true);
    Get.put<FirebaseFirestore>(FirebaseFirestore.instance, permanent: true);
    Get.put<GoogleSignIn>(GoogleSignIn.standard(), permanent: true);
    Get.put<GetStorage>(GetStorage(), permanent: true);

    Get.put<IAuthRepository>(
      AuthRepository(
        auth: Get.find<FirebaseAuth>(),
        googleSignIn: Get.find<GoogleSignIn>(),
        firestore: Get.find<FirebaseFirestore>(),
      ),
      permanent: true,
    );
    Get.put<IIuranRepository>(
      IuranRepository(
        firestore: Get.find<FirebaseFirestore>(),
      ),
      permanent: true,
    );
    Get.put<AuthController>(
      AuthController(
        authRepository: Get.find<IAuthRepository>(),
        storage: Get.find<GetStorage>(),
      ),
      permanent: true,
    );
  }
}
