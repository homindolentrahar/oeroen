import 'package:freezed_annotation/freezed_annotation.dart';

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
  final int? area;
  final int? zipCode;
  final String? langitude;
  final String? longitude;
  final List<DesaActivityDto>? activities;
  final List<DesaStakeholderDto>? stakeholders;

  DesaDto({
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
  });

  factory DesaDto.fromJson(Map<String, dynamic> json) =>
      _$DesaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DesaDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DesaActivityDto {
  final String? id;
  final String? name;
  final String? description;
  final String? iuranCategory;
  final int? startTimeIn24h;
  final int? endTimeIn24h;
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
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DesaStakeholderDto {
  final String? id;
  final String? name;
  final String? department;
  final String? image;
  final String? phoneNumber;
  final String? phone;

  DesaStakeholderDto({
    this.id,
    this.name,
    this.department,
    this.image,
    this.phoneNumber,
    this.phone,
  });

  factory DesaStakeholderDto.fromJson(Map<String, dynamic> json) =>
      _$DesaStakeholderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DesaStakeholderDtoToJson(this);
}
