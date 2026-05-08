import 'package:flutter/material.dart';
import 'package:movie_app/firebase_options.dart';
import 'screens/splash.dart';
import 'screens/OnBoarding/onBoarding.dart';
import 'screens/login.dart';
import 'screens/register.dart';
import 'screens/forgetPass.dart';
import 'screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash',
      routes: {
        'splash' : (context) => SplashView(),
        'onBoarding' : (context) => Onboarding1(),
        'login' : (context) => LoginScreen(),
        'register' : (context) => RegisterScreen(),
        'forgetPass' : (context) => Forgetpass(),
        'profile' : (context) => Profile(),
      },
    );
  }
}