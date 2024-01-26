import 'package:expiration_date/router/routes.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var appRouter = AppRouter();
  runApp(
    MaterialApp.router(routerConfig: appRouter.config(),),
  );
}
