import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w(0.02)),
        width: w(0.35),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(w(0.03)),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}