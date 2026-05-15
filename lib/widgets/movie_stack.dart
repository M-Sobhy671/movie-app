import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class MovieStack extends StatelessWidget {
  final List movies;
  final int currentIndex;
  final double Function(double) w;
  final void Function(int) onChanged;
  final VoidCallback onTap;


  const MovieStack({
    super.key,
    required this.movies,
    required this.currentIndex ,
    required this.w,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: w(0.9),
      child: PageView.builder(
        itemCount: movies.length,
        controller: PageController(viewportFraction: 0.6),
        onPageChanged: onChanged,
        itemBuilder: (context, index) {
          final active = index == currentIndex;

          var width = MediaQuery.of(context).size.width;
          var height = MediaQuery.of(context).size.height;
          return GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Transform.scale(
                scale: active ? 1 : 0.85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(w(0.04)),
                  child: Stack(
                    children: [
                      Image.asset(
                      movies[index],
                      fit: BoxFit.cover,),
                      Container(
                        margin: EdgeInsets.all(width*0.04),
                        decoration: BoxDecoration(
                            color: Color(0xB5121312),
                            borderRadius: BorderRadiusGeometry.circular(10)
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical:width*0.01
                              ,horizontal:height*0.01 ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: width*0.03,
                            children: [
                              Text('7.6',style: TextStyle(
                                  color: Appcolors.whiteColor,
                                  fontSize:22,
                              ),),
                              Image.asset(Appassets.fav_icon),

                            ],
                          ),
                        ),
                      )
                  ]
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}