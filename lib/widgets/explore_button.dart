import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appColors.dart';

Widget buildGenreChip(String title, bool isSelected) {

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      
      color: isSelected ?  Appcolors.yellowColor : Colors.transparent,
      borderRadius: BorderRadius.circular(16),

      border: Border.all(
        color: Appcolors.yellowColor,
        width: 2,
      ),
    ),
    child: Text(
      title,
      style: TextStyle(
        color: isSelected ? Appcolors.blackColor :  Appcolors.yellowColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}