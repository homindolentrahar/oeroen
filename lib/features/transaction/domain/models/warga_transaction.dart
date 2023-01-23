class PaidUser {
  final String? userId;
  final DateTime? paidAt;

  PaidUser({
    this.userId,
    this.paidAt,
  });
}

class WargaTransaction {
  final String? id;
  final String? desaId;
  final String? desaCode;
  final String? categorySlug;
  final double? amount;
  final DateTime? createdAt;
  final List<PaidUser>? paidUsers;

  WargaTransaction(
      {this.id,
      this.desaId,
      this.desaCode,
      this.categorySlug,
      this.amount,
      this.createdAt,
      this.paidUsers});
}
