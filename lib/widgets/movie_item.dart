import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class MovieItem extends StatelessWidget {
  final String image;
  final double Function(double) w;
  final VoidCallback onTap;

  const MovieItem({
    super.key,
    required this.image,
    required this.w,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w(0.02)),
        width: w(0.35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(w(0.03)),
          child: Stack(
            children: [Image.asset(
              image,
              fit: BoxFit.cover,
            ),
              Container(
                margin: EdgeInsets.all(width*0.02),
                decoration: BoxDecoration(
                    color: Color(0xB5121312),
                    borderRadius: BorderRadiusGeometry.circular(10)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:width*0.01
                      ,horizontal:height*0.01 ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: width*0.02,
                    children: [
                      Text('7.6',style: TextStyle(
                        color: Appcolors.whiteColor,
                        fontSize:16,
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
    );
  }
}