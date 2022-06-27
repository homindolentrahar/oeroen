import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_theme.dart';

void main() {
  runApp(const OeroenApp());
}

class OeroenApp extends StatelessWidget {
  const OeroenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oeroen',
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: const SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("Oeroen"),
          ),
        ),
      ),
    );
  }
}
