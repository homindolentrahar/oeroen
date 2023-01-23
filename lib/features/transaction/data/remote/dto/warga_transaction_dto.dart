import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';

part 'warga_transaction_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PaidUserDto {
  final String? userId;
  final String? paidAt;

  PaidUserDto({
    this.userId,
    this.paidAt,
  });

  factory PaidUserDto.fromJson(Map<String, dynamic> json) =>
      _$PaidUserDtoFromJson(json);

  factory PaidUserDto.fromModel(PaidUser model) => PaidUserDto(
        userId: model.userId,
        paidAt: model.paidAt?.toIso8601String(),
      );

  Map<String, dynamic> toJson() => _$PaidUserDtoToJson(this);

  PaidUser toModel() => PaidUser(
        userId: userId,
        paidAt: paidAt == null
            ? null
            : DateTime.parse(paidAt ?? DateTime(1970).toIso8601String()),
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class WargaTransactionDto {
  @JsonKey(ignore: true)
  String? id;
  final String? desaId;
  final String? desaCode;
  final String? categorySlug;
  final double? amount;
  final String? createdAt;
  final List<PaidUserDto>? paidUsers;

  WargaTransactionDto({
    this.id,
    this.desaId,
    this.desaCode,
    this.categorySlug,
    this.amount,
    this.createdAt,
    this.paidUsers,
  });

  factory WargaTransactionDto.fromJson(Map<String, dynamic> json) =>
      _$WargaTransactionDtoFromJson(json);

  factory WargaTransactionDto.fromModel(WargaTransaction model) =>
      WargaTransactionDto(
        id: model.id,
        desaId: model.desaId,
        desaCode: model.desaCode,
        categorySlug: model.categorySlug,
        amount: model.amount,
        createdAt: model.createdAt?.toIso8601String(),
        paidUsers:
            model.paidUsers?.map((e) => PaidUserDto.fromModel(e)).toList(),
      );

  Map<String, dynamic> toJson() => _$WargaTransactionDtoToJson(this);

  WargaTransaction toModel() => WargaTransaction(
        id: id,
        desaId: desaId,
        desaCode: desaCode,
        categorySlug: categorySlug,
        amount: amount,
        createdAt: createdAt == null
            ? null
            : DateTime.parse(createdAt ?? DateTime(1970).toIso8601String()),
        paidUsers: paidUsers == null
            ? []
            : paidUsers?.map((e) => e.toModel()).toList(),
      );
}
