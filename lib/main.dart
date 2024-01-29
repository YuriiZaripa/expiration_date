import 'package:expiration_date/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:expiration_date/dependency_injection.dart' as di;


void main() {
  di.setup();
  
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}
