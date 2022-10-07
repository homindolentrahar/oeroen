import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oeroen/app_config.dart';
import 'package:oeroen/common/theme/app_theme.dart';
import 'package:oeroen/routes/app_route.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: AppRoute.initialRoute,
      getPages: AppRoute.routes,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
