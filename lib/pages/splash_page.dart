import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_flutter_apps/pages/home_page.dart';
import 'package:my_flutter_apps/ui_helper/color_util.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BMIHomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: themeColor,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Card(
            color: const Color.fromARGB(255, 190, 185, 236),
            elevation: 10,
            child: Image.asset(
              'assets/images/BMIicon.png',
              width: 150,
            ),
          ),
        ),
      ),
    );
  }
}
