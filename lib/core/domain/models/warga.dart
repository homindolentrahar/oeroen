class Warga {
  final String? userId;
  final String? email;
  final String? phoneNumber;
  final String? fullname;
  final DateTime? birthday;
  final String? gender;
  final String? image;
  final List<WargaDesa>? listDesa;
  final DateTime? createdAt;

  Warga({
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
}

class WargaDesa {
  final String? uniqueCode;
  final String? address;
  final String? name;

  WargaDesa({
    this.uniqueCode,
    this.address,
    this.name,
  });
}
