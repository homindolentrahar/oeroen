class Desa {
  final String? id;
  final String? adminId;
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
  final List<DesaActivity>? activities;
  final List<DesaStakeholder>? stakeholders;
  final List<IuranDesa>? iurans;

  Desa({
    this.id,
    this.adminId,
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
    this.iurans,
  });
}

class DesaActivity {
  final String? id;
  final String? name;
  final String? description;
  final String? iuranCategory;
  final String? startTimeIn24h;
  final String? endTimeIn24h;
  final List<int>? scheduleDays;

  DesaActivity({
    this.id,
    this.name,
    this.description,
    this.iuranCategory,
    this.startTimeIn24h,
    this.endTimeIn24h,
    this.scheduleDays,
  });
}

class DesaStakeholder {
  final String? id;
  final String? name;
  final String? department;
  final String? image;
  final String? phoneNumber;
  final String? address;

  DesaStakeholder({
    this.id,
    this.name,
    this.department,
    this.image,
    this.phoneNumber,
    this.address,
  });
}

class IuranDesa {
  final String? id;
  final String? categorySlug;
  final String? iuranType;
  final double? amount;
  final DateTime? iuranPeriod;
  final DateTime? createdAt;

  IuranDesa({
    this.id,
    this.categorySlug,
    this.iuranType,
    this.amount,
    this.iuranPeriod,
    this.createdAt,
  });
}
