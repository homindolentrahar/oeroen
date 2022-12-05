enum IuranFilterType { category, sort, paidType }

class IuranFilter {
  final IuranFilterType? type;
  final String? title;
  final String? slug;
  final String? icon;

  IuranFilter({
    this.type,
    this.title,
    this.slug,
    this.icon,
  });
}

class IuranFilterOrderBy {
  final String orderField;
  final bool descending;

  IuranFilterOrderBy({
    required this.orderField,
    required this.descending,
  });
}
