import 'package:flutter/material.dart';
import 'package:movie_app/screens/OnBoarding/onboarding2.dart';
import 'package:movie_app/screens/OnBoarding/onboarding4.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    double w(double v) => width * v;

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              Appassets.onboarding3,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: IgnorePointer(
              child: Image.asset(
                Appassets.overlay3,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Explore All Genres',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: w(0.055),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: w(0.042),
                      fontWeight: FontWeight.w400,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Onboarding4(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.yellowColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Onboarding2(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Appcolors.yellowColor),
                        foregroundColor: Appcolors.yellowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}