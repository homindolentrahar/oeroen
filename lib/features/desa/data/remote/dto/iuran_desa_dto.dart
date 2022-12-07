import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/features/desa/domain/models/iuran_desa.dart';

part 'iuran_desa_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IuranDesaDto {
  @JsonKey(ignore: true)
  String? id;
  final String? categorySlug;
  final String? iuranType;
  final double? amount;
  final String? iuranPeriod;
  final String? createdAt;

  IuranDesaDto({
    this.id,
    this.categorySlug,
    this.iuranType,
    this.amount,
    this.iuranPeriod,
    this.createdAt,
  });

  factory IuranDesaDto.fromModel(IuranDesa data) => IuranDesaDto(
        id: data.id,
        categorySlug: data.categorySlug,
        iuranType: data.iuranType,
        amount: data.amount,
        iuranPeriod: data.iuranPeriod?.toIso8601String(),
        createdAt: data.createdAt?.toIso8601String(),
      );

  factory IuranDesaDto.fromJson(Map<String, dynamic> json) =>
      _$IuranDesaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IuranDesaDtoToJson(this);

  IuranDesa toModel() => IuranDesa(
        id: id,
        categorySlug: categorySlug,
        iuranType: iuranType,
        amount: amount,
        iuranPeriod: iuranPeriod == null
            ? null
            : DateTime.parse(iuranPeriod ?? DateTime(1970).toIso8601String()),
        createdAt: createdAt == null
            ? null
            : DateTime.parse(createdAt ?? DateTime(1970).toIso8601String()),
      );
}
