import 'package:flutter/widgets.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_category.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/urunan/domain/model/payment_method.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

class Constants {
  static const String dummyDesaCode = "DSA001";
  static const String dummyDesaId = "dcca4c2b-86cf-42a9-898f-c1e97e1a37c7";

  static List<IuranFilter> iuranFilters = [
    IuranFilter(
      type: IuranFilterType.category,
      slug: "kebersihan",
      title: "Kebersihan",
      icon: "assets/icons/ic_kebersihan.svg",
    ),
    IuranFilter(
      type: IuranFilterType.category,
      slug: "keamanan",
      title: "Keamanan",
      icon: "assets/icons/ic_keamanan.svg",
    ),
    IuranFilter(
      type: IuranFilterType.category,
      slug: "kas",
      title: "Kas",
      icon: "assets/icons/ic_kas.svg",
    ),
    IuranFilter(
      type: IuranFilterType.category,
      slug: "arisan",
      title: "Arisan",
      icon: "assets/icons/ic_arisan.svg",
    ),
    IuranFilter(
      type: IuranFilterType.category,
      slug: "sosial",
      title: "Sosial",
      icon: "assets/icons/ic_sosial.svg",
    ),
    IuranFilter(
      type: IuranFilterType.category,
      slug: "donasi",
      title: "Donasi",
      icon: "assets/icons/ic_donasi.svg",
    ),
    IuranFilter(
      type: IuranFilterType.sort,
      slug: "amount_desc",
      title: "Nominal Tertinggi",
    ),
    IuranFilter(
      type: IuranFilterType.sort,
      slug: "amount_asc",
      title: "Nominal Terendah",
    ),
    IuranFilter(
      type: IuranFilterType.sort,
      slug: "latest",
      title: "Terbaru",
    ),
    IuranFilter(
      type: IuranFilterType.sort,
      slug: "oldest",
      title: "Terlama",
    ),
    IuranFilter(
      type: IuranFilterType.paidType,
      slug: "paid",
      title: "Lunas",
    ),
    IuranFilter(
      type: IuranFilterType.paidType,
      slug: "due",
      title: "Belum Lunas",
    ),
  ];

  static List<IuranCategory> iuranCategories = [
    IuranCategory(
      categorySlug: "kebersihan",
      categoryName: "Kebersihan",
      categoryIcon: "assets/icons/ic_kebersihan.svg",
    ),
    IuranCategory(
      categorySlug: "keamanan",
      categoryName: "Keamanan",
      categoryIcon: "assets/icons/ic_keamanan.svg",
    ),
    IuranCategory(
      categorySlug: "kas",
      categoryName: "Kas",
      categoryIcon: "assets/icons/ic_kas.svg",
    ),
    IuranCategory(
      categorySlug: "arisan",
      categoryName: "Arisan",
      categoryIcon: "assets/icons/ic_arisan.svg",
    ),
    IuranCategory(
      categorySlug: "sosial",
      categoryName: "Sosial",
      categoryIcon: "assets/icons/ic_sosial.svg",
    ),
    IuranCategory(
      categorySlug: "donasi",
      categoryName: "Donasi",
      categoryIcon: "assets/icons/ic_donasi.svg",
    ),
  ];
}

final Map<String, IuranFilterOrderBy> iuranFilterOrderByMap = {
  'amount_asc': IuranFilterOrderBy(orderField: 'amount', descending: false),
  'amount_desc': IuranFilterOrderBy(orderField: 'amount', descending: true),
  'latest': IuranFilterOrderBy(orderField: 'created_at', descending: true),
  'oldest': IuranFilterOrderBy(orderField: 'created_at', descending: false),
};

final Map<UrunanType, String> typeIcons = {
  UrunanType.keamanan: "assets/icons/keamanan.svg",
  UrunanType.kebersihan: "assets/icons/kebersihan.svg",
  UrunanType.kas: "assets/icons/kas.svg",
  UrunanType.donasi: "assets/icons/donasi.svg",
};

final Map<UrunanType, Color> typeColors = {
  UrunanType.keamanan: AppColor.keamanan,
  UrunanType.kebersihan: AppColor.kebersihan,
  UrunanType.kas: AppColor.kas,
  UrunanType.donasi: AppColor.donasi,
};

final List<PaymentMethod> paymentMethods = [
  PaymentMethod("assets/images/gopay.png", "GoPay", "0857-1234-5678", 25000),
  PaymentMethod("assets/images/dana.png", "DANA", "0857-1234-5678", 45000),
  PaymentMethod("assets/images/spay.png", "ShopeePay", "0857-1234-5678", 50000),
  PaymentMethod("assets/images/bca.png", "BCA", "1123219391", 75000),
];
