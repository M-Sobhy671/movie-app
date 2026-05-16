import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/cubits/movies_cubit.dart';
import 'package:movie_app/screens/cubits/movies_state.dart';
import 'package:movie_app/screens/Home/movie_details.dart';
import 'package:movie_app/widgets/movie_item.dart';
import 'package:movie_app/widgets/movie_stack.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentMovieIndex = 0;

  late double width;
  late double Function(double) w;

  void goToDetails(String imagePath, String namePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetails(
          movieImage: imagePath,
          movieName: namePath,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<MoviesCubit>().getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    w = (v) => width * v;

    return Scaffold(
      backgroundColor: const Color(0xFF121312),
      extendBody: true,

      body: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {

          if (state is MoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MoviesError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          if (state is MoviesSuccess) {
            final movies = state.movies;

            if (movies.isEmpty) {
              return const Center(
                child: Text(
                  "No Movies Found",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final safeIndex = currentMovieIndex.clamp(0, movies.length - 1);

            return Stack(
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
                          child: Image.network(
                            movies[safeIndex].imageUrl,
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

                Container(color: Colors.black.withValues(alpha: 0.25)),

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
                          movies: movies.map((e) => e.imageUrl).toList(),
                          ratings: movies.map((e) => e.rating).toList(), 
                          currentIndex: safeIndex,
                          w: w,
                          onChanged: (index) {
                            setState(() {
                              currentMovieIndex = index;
                            });
                          },
                          onTap: () => goToDetails(
                            movies[safeIndex].imageUrl,
                            movies[safeIndex].title,
                          ),
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              InkWell(
                                onTap: () {},
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
                                      Icons.arrow_forward_outlined,
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
                                image: movies[index].imageUrl,
                                rating: movies[index].rating, 
                                w: w,
                                onTap: () => goToDetails(
                                  movies[index].imageUrl,
                                  movies[index].title,
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: w(0.12)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}

//لسا سشكن الافلام اللى تحت هيتعدل 