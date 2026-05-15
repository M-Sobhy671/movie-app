import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/widgets/movie_item.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolors.blackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: Checkbox.width*3.5,
        horizontal: Checkbox.width*1),
        child: SingleChildScrollView(
          child: Column(
            spacing: height*0.015,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(style: TextStyle(
                color: Appcolors.whiteColor,
                fontSize: 16,
                  fontWeight:FontWeight.w500,
                height: height*0.002
              ),
                decoration: InputDecoration(
                  prefixIcon: Image.asset(Appassets.search_icon),
                  filled: true,
                  fillColor: Appcolors.grayColor,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Appcolors.whiteColor,fontSize: 16,
                      fontWeight:FontWeight.w500 ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
                ),
              ),
              Row(
                spacing: width*0.03,
                children: [
                  Expanded(child: MovieCard(Appassets.movie_1, context)),
                  Expanded(child: MovieCard(Appassets.movie_2, context)),
                ],
              ),
              Row(
                spacing: width*0.03,
                children: [
                  Expanded(child: MovieCard(Appassets.movie_3, context)),
                  Expanded(child: MovieCard(Appassets.movie_4, context)),
                ],
              ),
              Row(
                spacing: width*0.03,
                children: [
                  Expanded(child: MovieCard(Appassets.movie_5, context)),
                  Expanded(child: MovieCard(Appassets.movie_6, context)),
                ],
              ),
              Row(
                spacing: width*0.03,
                children: [
                  Expanded(child: MovieCard(Appassets.movie_4, context)),
                  Expanded(child: MovieCard(Appassets.movie_1, context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
