import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

Widget MovieCard(
    String image,
    BuildContext context,
    ) {
  // TODO: implement MovieCard
  var width = MediaQuery.of(context).size.width;
  var height= MediaQuery.of(context).size.height;
  
  return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16)
          ),
          child: Image.asset(
          image,
          fit: BoxFit.cover,),
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
  );
}