import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/routes/app_route.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetRouterOutlet(
          initialRoute: AppRoute.loginEmailRoute,
          anchorRoute: AppRoute.authRoute,
        ),
      ),
    );
  }
}
