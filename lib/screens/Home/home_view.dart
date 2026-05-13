import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_app/screens/details.dart';
import 'package:movie_app/widgets/movie_item.dart';
import 'package:movie_app/widgets/movie_stack.dart';
import 'package:movie_app/widgets/navbar.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  int currentMovieIndex = 0;

  List<String> movies = [
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
    "assets/images/onboarding4.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  late double width;
  late double Function(double) w;

  void goToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const DetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    w = (v) => width * v;

    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      extendBody: true,

      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Image.asset(
                      movies[currentMovieIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: w(0.25),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xFF121312),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(color: Colors.black.withOpacity(0.25)),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: w(0.02)),

                  SizedBox(
                    width: w(0.62),
                    height: w(0.22),
                    child: Image.asset(
                      "assets/images/available_now.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: w(0.04)),

                  MovieStack(
                    movies: movies,
                    currentIndex: currentMovieIndex,
                    w: w,
                    onChanged: (i) => setState(() => currentMovieIndex = i),
                    onTap: goToDetails,
                  ),

                  SizedBox(height: w(0.03)),

                  SizedBox(
                    width: w(0.85),
                    height: w(0.35),
                    child: Image.asset(
                      "assets/images/watch_now.png",
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: w(0.04)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w(0.04)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Action",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: goToDetails,
                          child: Row(
                            children: [
                              Text(
                                "See More",
                                style: TextStyle(
                                  color: const Color(0xFFFFBB3B),
                                  fontSize: w(0.04),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 14,
                                color: Color(0xFFFFBB3B),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: w(0.03)),

                  SizedBox(
                    height: w(0.55),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        return MovieItem(
                          image: movies[index],
                          w: w,
                          onTap: goToDetails,
                        );
                      },
                    ),
                  ),

                  SizedBox(height: w(0.12)),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: NavBar(
              w: w,
              currentIndex: currentIndex,
              onTap: (i) => setState(() => currentIndex = i),
            ),
          ),
        ],
      ),
    );
  }
}