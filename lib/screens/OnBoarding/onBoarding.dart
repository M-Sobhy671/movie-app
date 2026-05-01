import 'package:flutter/material.dart';
import 'package:movie_app/screens/OnBoarding/onboarding2.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double w(double value) => width * value;

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              Appassets.onboarding1,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              Appassets.overlay1,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: w(0.05)),
            child: Column(
              children: [
                const Spacer(),

                Text(
                  'Find Your Next\nFavorite Movie Here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: (width * 0.09).clamp(22, 40),
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: w(0.06)),

                SizedBox(
                  width: w(0.90),
                  child: Text(
                    'Get access to a huge library of movies to suit all tastes. You will surely like it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: (width * 0.05).clamp(14, 22),
                      fontWeight: FontWeight.w400,
                      height: 1.6,
                    ),
                  ),
                ),

                SizedBox(height: w(0.08)),

                SizedBox(
                  width: double.infinity,
                  height: w(0.14),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboarding2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.yellowColor,
                      foregroundColor: Appcolors.blackColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'Explore Now',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: (width * 0.045).clamp(14, 20),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: w(0.08)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}