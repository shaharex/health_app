import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_health_data_worldskills/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool toggle = true;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        toggle = false;
      });
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              alignment: Alignment.center,
              width: toggle ? 50 : 100,
              height: toggle ? 50 : 100,
              child: Image.asset('/logo_symbol/symbol.png'),
            ),
            AnimatedDefaultTextStyle(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 2500),
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: toggle ? FontWeight.w400 : FontWeight.bold),
              child: const Text('MY Health Data'),
            ),
          ],
        ),
      ),
    );
  }
}
