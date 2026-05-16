import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class MovieStack extends StatelessWidget {
  final List<String> movies;
  final List<double> ratings; 
  final int currentIndex;
  final double Function(double) w;
  final void Function(int) onChanged;
  final VoidCallback onTap;

  const MovieStack({
    super.key,
    required this.movies,
    required this.ratings, 
    required this.currentIndex,
    required this.w,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: w(0.9),
      child: PageView.builder(
        itemCount: movies.length,
        controller: PageController(viewportFraction: 0.6),
        onPageChanged: onChanged,
        itemBuilder: (context, index) {
          final active = index == currentIndex;

          return GestureDetector(
            onTap: onTap,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 300),
              scale: active ? 1 : 0.85,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(w(0.04)),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        movies[index],
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned(
                      top: width * 0.04,
                      left: width * 0.04,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xB5121312),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: width * 0.01,
                            horizontal: height * 0.01,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                ratings[index].toStringAsFixed(1), 
                                style: TextStyle(
                                  color: Appcolors.whiteColor,
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              Image.asset(Appassets.fav_icon),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}