import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    primaryColor: AppColor.primary,
    canvasColor: AppColor.white,
    textTheme: const TextTheme(
      headline3: TextStyle(
        fontSize: 24,
        fontFamily: AppFont.semiBold,
      ),
      headline4: TextStyle(
        fontSize: 20,
        fontFamily: AppFont.semiBold,
      ),
      headline5: TextStyle(
        fontSize: 16,
        fontFamily: AppFont.semiBold,
      ),
      headline6: TextStyle(
        fontSize: 12,
        fontFamily: AppFont.semiBold,
      ),
      bodyText1: TextStyle(
        fontSize: 14,
        fontFamily: AppFont.regular,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        fontFamily: AppFont.regular,
      ),
      caption: TextStyle(
        fontSize: 10,
        fontFamily: AppFont.regular,
      ),
    ),
  );
}
