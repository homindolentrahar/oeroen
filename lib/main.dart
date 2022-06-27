import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oeroen/common/theme/app_theme.dart';
import 'package:oeroen/routes/app_routes.dart';

final _appRouter = AppRouter();

void main() {
  runApp(const OeroenApp());
}

class OeroenApp extends StatelessWidget {
  const OeroenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Oeroen',
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
    );
  }
}
