import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class MovieItem extends StatelessWidget {
  final String image;
  final double rating; 
  final double Function(double) w;
  final VoidCallback onTap;

  const MovieItem({
    super.key,
    required this.image,
    required this.rating,
    required this.w,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w(0.02)),
        width: w(0.35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(w(0.03)),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  image, 
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: width * 0.02,
                left: width * 0.02,
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
                          rating.toStringAsFixed(1), 
                          style: TextStyle(
                            color: Appcolors.whiteColor,
                            fontSize: 16,
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
  }
}