import 'package:flutter/material.dart';
import 'screens/splash.dart';
import 'screens/onBoarding.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/forgetPass.dart';
import 'screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'forgetPass',
      routes: {
        'splash' : (context) => Splash(),
        'onBoarding' : (context) => Onboarding(),
        'login' : (context) => Login(),
        'register' : (context) => Register(),
        'forgetPass' : (context) => Forgetpass(),
        'profile' : (context) => Profile(),
      },
    );
  }
}