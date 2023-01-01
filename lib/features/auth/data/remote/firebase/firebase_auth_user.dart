import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';

part 'firebase_auth_user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FirebaseAuthUser {
  @JsonKey(ignore: true)
  String? userId;
  final String? email;
  final String? displayName;
  final String? phoneNumber;
  final String? providerId;
  final String? createdAt;
  final String? lastSignedInAt;
  final bool? isVerified;
  String? role;

  FirebaseAuthUser({
    this.userId,
    this.email,
    this.displayName,
    this.phoneNumber,
    this.providerId,
    this.createdAt,
    this.lastSignedInAt,
    this.isVerified,
    this.role,
  });

  factory FirebaseAuthUser.fromJson(Map<String, dynamic> json) =>
      _$FirebaseAuthUserFromJson(json);

  factory FirebaseAuthUser.fromUser(User? user) => FirebaseAuthUser(
        userId: user?.uid,
        email: user?.email,
        displayName: user?.displayName,
        phoneNumber: user?.phoneNumber,
        providerId: user?.providerData.first.providerId,
        createdAt: user?.metadata.creationTime?.toIso8601String(),
        lastSignedInAt: user?.metadata.lastSignInTime?.toIso8601String(),
        isVerified: user?.emailVerified,
      );

  Map<String, dynamic> toJson() => _$FirebaseAuthUserToJson(this);

  AuthUser toAuthUser() => AuthUser(
        userId: userId ?? "",
        email: email ?? "",
        displayName: displayName ?? "",
        phoneNumber: phoneNumber ?? "",
        providerId: providerId ?? "",
        createdAt: DateTime.parse(createdAt ?? ""),
        lastSignedInAt: DateTime.parse(lastSignedInAt ?? ""),
        isVerified: isVerified ?? false,
        role: role ?? "",
      );
}
