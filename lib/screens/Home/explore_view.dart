import 'package:flutter/material.dart';
import 'package:movie_app/utiles/appAssets.dart';
import 'package:movie_app/utiles/appColors.dart';
import 'package:movie_app/widgets/explore_button.dart';
import 'package:movie_app/widgets/movie_card.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final List<String> genres = ['Action', 'Adventure', 'Animation', 'Biography'];
  int selectedIndex =0;

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
            spacing: height*0.02,
            children: [
              SizedBox(
                height: height*0.05,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: width*0.03),
                        child: buildGenreChip(
                          genres[index],
                          selectedIndex == index,
                        ),
                      ),
                    );
                  },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
