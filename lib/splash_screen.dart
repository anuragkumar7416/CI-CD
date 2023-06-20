import 'dart:async';

import 'package:cicd_test/home_screen.dart';
import 'package:cicd_test/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> getBoolValuesSF() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLogin');

    Timer(
      const Duration(seconds: 3),
          () => _onNavigateToNextScreen(isLoggedIn ?? false),
    );
  }

  void _onNavigateToNextScreen(bool isLoggedIn) {
    if (isLoggedIn) {

      Get.to(()=>const HomeScreen());

    } else {
      Get.to(()=>const LoginScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    getBoolValuesSF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/netflix_logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
