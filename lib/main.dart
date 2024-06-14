import 'package:easy_localization/easy_localization.dart';
import 'package:expiration_date/generated/codegen_loader.g.dart';
import 'package:expiration_date/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;

void main() async {
  di.setup();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('uk')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const ExpirationDateApp()
    ),
  );
}

class ExpirationDateApp extends StatelessWidget {
  const ExpirationDateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const HomePage(),
    );
  }
}

