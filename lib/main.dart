import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/pages/navigation_page.dart';
import 'package:my_health_data_worldskills/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Health Data',
      home: SplashPage(),
      theme: ThemeData(
        navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle:
              MaterialStatePropertyAll(TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
