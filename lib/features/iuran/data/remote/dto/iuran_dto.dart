import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';

part 'iuran_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class IuranDto {
  @JsonKey(ignore: true)
  String? id;
  final String? userId;
  final String? desaCode;
  final String? categorySlug;
  final double? amount;
  final bool? isPaid;
  final String? createdAt;
  final String? paidAt;

  IuranDto({
    this.id,
    this.userId,
    this.desaCode,
    this.categorySlug,
    this.amount,
    this.isPaid,
    this.createdAt,
    this.paidAt,
  });

  factory IuranDto.fromModel(Iuran data) => IuranDto(
        id: data.id,
        userId: data.userId,
        desaCode: data.desaCode,
        categorySlug: data.categorySlug,
        amount: data.amount,
        isPaid: data.isPaid,
        createdAt: data.createdAt?.toIso8601String(),
        paidAt: data.paidAt?.toIso8601String(),
      );

  factory IuranDto.fromJson(Map<String, dynamic> json) =>
      _$IuranDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IuranDtoToJson(this);

  Iuran toModel() => Iuran(
        id: id,
        userId: userId,
        desaCode: desaCode,
        categorySlug: categorySlug,
        amount: amount,
        isPaid: isPaid,
        createdAt: createdAt == null
            ? null
            : DateTime.parse(createdAt ?? DateTime(1970).toIso8601String()),
        paidAt: paidAt == null
            ? null
            : DateTime.parse(paidAt ?? DateTime(1970).toIso8601String()),
      );
}
