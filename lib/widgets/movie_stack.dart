import 'dart:ui';
import 'package:flutter/material.dart';

class MovieStack extends StatelessWidget {
  final List movies;
  final int currentIndex;
  final double Function(double) w;
  final Function(int) onChanged;
  final VoidCallback onTap;

  const MovieStack({
    super.key,
    required this.movies,
    required this.currentIndex,
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

          return GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Transform.scale(
                scale: active ? 1 : 0.85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(w(0.04)),
                  child: Image.asset(
                    movies[index],
                    fit: BoxFit.cover,
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