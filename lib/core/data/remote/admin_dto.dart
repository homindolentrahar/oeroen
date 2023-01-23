import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/core/domain/models/admin.dart';
import 'package:oeroen/features/auth/data/remote/firebase/firebase_auth_user.dart';

part 'admin_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AdminDto {
  @JsonKey(ignore: true)
  String? adminId;
  final String? phoneNumber;
  final String? email;
  final String? fullname;
  final String? gender;
  final String? image;
  final String? createdAt;

  AdminDto({
    this.adminId,
    this.phoneNumber,
    this.email,
    this.fullname,
    this.gender,
    this.image,
    this.createdAt,
  });

  factory AdminDto.fromJson(Map<String, dynamic> json) =>
      _$AdminDtoFromJson(json);

  factory AdminDto.fromFirebaseUser(FirebaseAuthUser user) => AdminDto(
        adminId: user.userId,
        email: user.email,
        phoneNumber: user.phoneNumber,
        fullname: user.displayName,
        createdAt: user.createdAt,
      );

  Map<String, dynamic> toJson() => _$AdminDtoToJson(this);

  Admin toModel() => Admin(
        adminId: adminId,
        email: email,
        phoneNumber: phoneNumber,
        fullname: fullname,
        gender: gender,
        image: image,
        createdAt: createdAt,
      );
}
