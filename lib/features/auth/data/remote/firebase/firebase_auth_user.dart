import 'package:firebase_auth/firebase_auth.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';

class FirebaseAuthUser {
  final String? userId;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final String? providerId;
  final DateTime? createdAt;
  final DateTime? lastSignedInAt;
  final bool? isVerified;

  FirebaseAuthUser({
    this.userId,
    this.email,
    this.displayName,
    this.phoneNumber,
    this.providerId,
    this.createdAt,
    this.lastSignedInAt,
    this.isVerified,
  });

  factory FirebaseAuthUser.fromUser(User? user) => FirebaseAuthUser(
        userId: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        phoneNumber: user?.phoneNumber,
        providerId: user?.providerData.first.providerId,
        createdAt: user?.metadata.creationTime,
        lastSignedInAt: user?.metadata.lastSignInTime,
        isVerified: user?.emailVerified,
      );

  AuthUser toAuthUser() => AuthUser(
        userId: userId ?? "",
        email: email ?? "",
        displayName: displayName ?? "",
        phoneNumber: phoneNumber ?? "",
        providerId: providerId ?? "",
        createdAt: createdAt ?? DateTime.now(),
        lastSignedInAt: lastSignedInAt ?? DateTime.now(),
        isVerified: isVerified ?? false,
      );
}
