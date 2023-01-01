import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/auth/data/remote/firebase/firebase_auth_user.dart';

part 'warga_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class WargaDto {
  @JsonKey(ignore: true)
  String? userId;
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

  Warga toModel() => Warga(
        userId: userId,
        email: email,
        phoneNumber: phoneNumber,
        fullname: fullname,
        birthday: birthday == null
            ? null
            : DateTime.parse(birthday ?? DateTime(1970).toIso8601String()),
        gender: gender,
        image: image,
        listDesa: listDesa?.map((e) => e.toModel()).toList(),
        createdAt: birthday == null
            ? null
            : DateTime.parse(createdAt ?? DateTime(1970).toIso8601String()),
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WargaDesaDto {
  @JsonKey(name: 'desa_id')
  final String? id;
  final String? uniqueCode;
  final String? address;
  final String? name;

  WargaDesaDto({
    this.id,
    this.uniqueCode,
    this.address,
    this.name,
  });

  factory WargaDesaDto.fromJson(Map<String, dynamic> json) =>
      _$WargaDesaDtoFromJson(json);

  factory WargaDesaDto.fromModel(WargaDesa data) => WargaDesaDto(
        id: data.id,
        uniqueCode: data.uniqueCode,
        address: data.address,
        name: data.name,
      );

  Map<String, dynamic> toJson() => _$WargaDesaDtoToJson(this);

  WargaDesa toModel() => WargaDesa(
        id: id,
        uniqueCode: uniqueCode,
        address: address,
        name: name,
      );
}
