import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Appcolors.blackColor,
    bottomNavigationBar: BottomNavigationBar(

      unselectedItemColor:Appcolors.whiteColor ,
      selectedItemColor: Appcolors.yellowColor,
      backgroundColor:Appcolors.grayColor ,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Appassets.home_icon)),
              label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Appassets.search_icon)),
              label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Appassets.explore_icon)),
              label: ''),
          BottomNavigationBarItem(icon: ImageIcon(AssetImage(Appassets.profile_icon)),
              label: ''),
        ]),
    );
  }
}
