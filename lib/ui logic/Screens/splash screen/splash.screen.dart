import 'dart:async';

import 'package:flutter_assesment/const/assets.dart';
import 'package:flutter_assesment/const/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Timer(const Duration(seconds: 2), ()=>Navigator.pushReplacementNamed(context, '/OnBoardingScreens'));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: kSignup,
        body: Center(child:Image.asset(Assets.splashScreen) ));
  }
}
