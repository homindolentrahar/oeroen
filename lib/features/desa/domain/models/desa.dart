class Desa {
  final String? id;
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
  final List<DesaActivity>? activities;
  final List<DesaStakeholder>? stakeholders;

  Desa({
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
  });
}

class DesaActivity {
  final String? id;
  final String? name;
  final String? description;
  final String? iuranCategory;
  final int? startTimeIn24h;
  final int? endTimeIn24h;
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
  final String? phone;

  DesaStakeholder({
    this.id,
    this.name,
    this.department,
    this.image,
    this.phoneNumber,
    this.phone,
  });
}
