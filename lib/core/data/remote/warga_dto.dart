import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/auth/data/remote/firebase/firebase_auth_user.dart';

part 'warga_dto.g.dart';

@JsonSerializable()
class WargaDto {
  @JsonKey(ignore: true)
  final String? userId;
  final String? email;
  final String? phoneNumber;
  final String? fullname;
  final String? birthday;
  final String? gender;
  final String? image;
  final List<WargaDesaDto>? listDesa;
  final String? createdAt;

  WargaDto({
    this.userId,
    this.email,
    this.phoneNumber,
    this.fullname,
    this.birthday,
    this.gender,
    this.image,
    this.listDesa,
    this.createdAt,
  });

  factory WargaDto.fromJson(Map<String, dynamic> json) =>
      _$WargaDtoFromJson(json);

  factory WargaDto.fromFirebaseUser(FirebaseAuthUser user) => WargaDto(
        userId: user.userId,
        email: user.email,
        phoneNumber: user.phoneNumber,
        createdAt: user.createdAt,
      );

  factory WargaDto.fromModel(Warga data) => WargaDto(
        userId: data.userId,
        email: data.email,
        phoneNumber: data.phoneNumber,
        fullname: data.fullname,
        birthday: data.birthday?.toIso8601String(),
        gender: data.gender,
        image: data.image,
        listDesa: data.listDesa?.map((e) => WargaDesaDto.fromModel(e)).toList(),
        createdAt: data.createdAt?.toIso8601String(),
      );

  Map<String, dynamic> toJson() => _$WargaDtoToJson(this);
}

@JsonSerializable()
class WargaDesaDto {
  final String? uniqueCode;
  final String? address;
  final String? name;

  WargaDesaDto({
    this.uniqueCode,
    this.address,
    this.name,
  });

  factory WargaDesaDto.fromJson(Map<String, dynamic> json) =>
      _$WargaDesaDtoFromJson(json);

  factory WargaDesaDto.fromModel(WargaDesa data) => WargaDesaDto(
        uniqueCode: data.uniqueCode,
        address: data.address,
        name: data.name,
      );

  Map<String, dynamic> toJson() => _$WargaDesaDtoToJson(this);
}
