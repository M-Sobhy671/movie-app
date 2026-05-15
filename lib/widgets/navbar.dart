import 'package:flutter/material.dart';
import 'package:movie_app/screens/Home/explore_view.dart';
import 'package:movie_app/screens/Home/home_view.dart';
import 'package:movie_app/screens/Home/profile_view.dart';
import 'package:movie_app/screens/Home/search_view.dart';
import 'package:movie_app/utiles/appAssets.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  int currentIndex = 0;

  final List<Widget> screens = [
    HomeView(),
    SearchView(),
    ExploreView(),
    ProfileView(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double w(double value) => screenWidth * value;

    return Scaffold(
      backgroundColor: Colors.transparent,

      body: Stack(
        children: [
          screens[currentIndex],

          Positioned(
            bottom: w(0.04),
            left: w(0.04),
            right: w(0.04),
            child: Container(
              height: w(0.15),
              decoration: BoxDecoration(
                color: const Color(0xFF282A28),
                borderRadius: BorderRadius.circular(w(0.05)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _icon(Appassets.home_icon, 0),
                  _icon(Appassets.search_icon, 1),
                  _icon(Appassets.explore_icon, 2),
                  _icon(Appassets.profile_icon, 3),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _icon(String imageIcon, int index) {

    final selected = currentIndex == index;

    return Expanded(
      child: InkWell(

        onTap: () => onTap(index),

        child: Image.asset(
          imageIcon,
          color: selected
              ? const Color(0xFFFFBB3B)
              : Colors.white,
        ),
      ),
    );
  }
}