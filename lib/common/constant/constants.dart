import 'package:flutter/widgets.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/features/urunan/domain/model/payment_method.dart';
import 'package:oeroen/features/urunan/domain/model/urunan_item.dart';

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
