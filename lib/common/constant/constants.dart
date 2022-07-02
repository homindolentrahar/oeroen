import 'package:flutter/widgets.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/features/urunan/domain/model/payment_method.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

final Map<UrunanType, String> typeIcons = {
  UrunanType.Keamanan: "assets/icons/keamanan.svg",
  UrunanType.Kebersihan: "assets/icons/kebersihan.svg",
  UrunanType.Kas: "assets/icons/kas.svg",
  UrunanType.Donasi: "assets/icons/donasi.svg",
};

final Map<UrunanType, Color> typeColors = {
  UrunanType.Keamanan: AppColor.keamanan,
  UrunanType.Kebersihan: AppColor.kebersihan,
  UrunanType.Kas: AppColor.kas,
  UrunanType.Donasi: AppColor.donasi,
};

final List<PaymentMethod> paymentMethods = [
  PaymentMethod("assets/images/gopay.png", "GoPay", "0857-1234-5678", 25000),
  PaymentMethod("assets/images/dana.png", "DANA", "0857-1234-5678", 45000),
  PaymentMethod("assets/images/spay.png", "ShopeePay", "0857-1234-5678", 50000),
  PaymentMethod("assets/images/bca.png", "BCA", "1123219391", 75000),
];
