class Iuran {
  final String? id;
  final String? userId;
  final String? desaCode;
  final String? categorySlug;
  final double? amount;
  final bool? isPaid;
  final DateTime? createdAt;
  final DateTime? paidAt;

  Iuran({
    this.id,
    this.userId,
    this.desaCode,
    this.categorySlug,
    this.amount,
    this.isPaid,
    this.createdAt,
    this.paidAt,
  });
}
