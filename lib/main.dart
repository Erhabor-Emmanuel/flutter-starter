import 'package:flutter/material.dart';
import 'package:flutter_assesment/ui%20logic/common%20widgets/bottom.nav_bar.dart';
import 'package:flutter_assesment/ui%20logic/home%20screen/home.dart';
import 'package:flutter_assesment/ui%20logic/onboarding/signUp_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(360, 690),
      builder: (BuildContext context, child){
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/BottomNavBar': (context)=> const BottomNavBar(),
         '/HomeScreen': (context) => const HomeScreen(),
        },
        home: const SignUp(),
      );
      }
    );
  }
}


