import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final Function(double) w;
  final int currentIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.w,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(w(0.04)),
      height: w(0.15),
      decoration: BoxDecoration(
        color: const Color(0xFF282A28),
        borderRadius: BorderRadius.circular(w(0.06)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _icon(Icons.home, 0),
          _icon(Icons.search, 1),
          _icon(Icons.play_arrow, 2),
          _icon(Icons.person, 3),
        ],
      ),
    );
  }

  Widget _icon(IconData icon, int index) {
    final selected = currentIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        child: Icon(
          icon,
          size: w(0.07),
          color: selected ? const Color(0xFFFFBB3B) : Colors.white,
        ),
      ),
    );
  }
}