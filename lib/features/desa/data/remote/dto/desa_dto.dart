import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';

part 'desa_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class DesaDto {
  @JsonKey(ignore: true)
  String? id;
  final String? uniqueCode;
  final String? name;
  final String? district;
  final String? city;
  final String? province;
  final int? population;
  final double? area;
  final String? zipCode;
  final String? langitude;
  final String? longitude;
  final List<DesaActivityDto>? activities;
  final List<DesaStakeholderDto>? stakeholders;
  final List<DesaPaymentMethodDto>? payments;
  final List<IuranDesaDto>? iurans;

  DesaDto({
    this.id,
    this.uniqueCode,
    this.name,
    this.district,
    this.city,
    this.province,
    this.population,
    this.area,
    this.zipCode,
    this.langitude,
    this.longitude,
    this.activities,
    this.stakeholders,
    this.payments,
    this.iurans,
  });

  factory DesaDto.fromJson(Map<String, dynamic> json) =>
      _$DesaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DesaDtoToJson(this);

  Desa toModel() => Desa(
        id: id,
        uniqueCode: uniqueCode,
        name: name,
        district: district,
        city: city,
        province: province,
        population: population,
        area: area,
        zipCode: zipCode,
        langitude: langitude,
        longitude: longitude,
        activities: activities?.map((e) => e.toModel()).toList(),
        stakeholders: stakeholders?.map((e) => e.toModel()).toList(),
        payments: payments?.map((e) => e.toModel()).toList(),
        iurans: iurans?.map((e) => e.toModel()).toList(),
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DesaActivityDto {
  final String? id;
  final String? name;
  final String? description;
  final String? iuranCategory;
  final String? startTimeIn24h;
  final String? endTimeIn24h;
  final List<int>? scheduleDays;

  DesaActivityDto({
    this.id,
    this.name,
    this.description,
    this.iuranCategory,
    this.startTimeIn24h,
    this.endTimeIn24h,
    this.scheduleDays,
  });

  factory DesaActivityDto.fromJson(Map<String, dynamic> json) =>
      _$DesaActivityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DesaActivityDtoToJson(this);

  DesaActivity toModel() => DesaActivity(
        id: id,
        name: name,
        description: description,
        iuranCategory: iuranCategory,
        startTimeIn24h: startTimeIn24h,
        endTimeIn24h: endTimeIn24h,
        scheduleDays: scheduleDays,
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DesaStakeholderDto {
  final String? id;
  final String? name;
  final String? department;
  final String? image;
  final String? phoneNumber;
  final String? address;

  DesaStakeholderDto({
    this.id,
    this.name,
    this.department,
    this.image,
    this.phoneNumber,
    this.address,
  });

  factory DesaStakeholderDto.fromJson(Map<String, dynamic> json) =>
      _$DesaStakeholderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DesaStakeholderDtoToJson(this);

  DesaStakeholder toModel() => DesaStakeholder(
        id: id,
        name: name,
        department: department,
        image: image,
        phoneNumber: phoneNumber,
        address: address,
      );
}

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

@JsonSerializable(fieldRename: FieldRename.snake)
class DesaPaymentMethodDto {
  @JsonKey(ignore: true)
  String? id;
  final String? image;
  final String? name;
  final String? number;

  DesaPaymentMethodDto({
    this.id,
    this.image,
    this.name,
    this.number,
  });

  factory DesaPaymentMethodDto.fromModel(DesaPaymentMethod data) =>
      DesaPaymentMethodDto(
        id: data.id,
        image: data.image,
        name: data.name,
        number: data.number,
      );

  factory DesaPaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$DesaPaymentMethodDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DesaPaymentMethodDtoToJson(this);

  DesaPaymentMethod toModel() => DesaPaymentMethod(
        id: id,
        image: image,
        name: name,
        number: number,
      );
}
