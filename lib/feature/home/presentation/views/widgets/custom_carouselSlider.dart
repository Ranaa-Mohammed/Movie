import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_errorWidget.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';
import '../../manger/fetchFuture_movie_cubit/fetchFuture_movie_states.dart';
import 'package:movie/core/utils/constans.dart';

class CustomCarouselSlider extends StatefulWidget {
   const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {

  CarouselSliderController carouselController = CarouselSliderController();
  int currentIndex = 0;

  // List<String> test = [
  //   'assets/images/ART-removebg-preview.png',
  //   'assets/images/ART-removebg-preview.png',
  //   'assets/images/ART-removebg-preview.png',
  //   'assets/images/ART-removebg-preview.png',
  //   'assets/images/ART-removebg-preview.png',
  //   'assets/images/ART-removebg-preview.png',
  // ];

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FetchFutureMovieCubit, FetchFutureMovieStates>(
      builder: (BuildContext context,  state) {
        if (state is FetchFutureMovieSuccess) {
          List<MovieModel> posters = [];
          for(var i =0 ; i <= 4 ; i++){
            posters.add(state.movie[i]);

          }
          return Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 200,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  viewportFraction: 0.5, // حجم الصورة بالنسبة للشاشة
                ),
                items: posters.map((poster) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        // المسافة بين العناصر
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage('$apiImage${poster.posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30,),
              AnimatedSmoothIndicator(
                count: posters.length,
                activeIndex: currentIndex,
                onDotClicked: (index) {
                  carouselController.animateToPage(index);
                },
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.red,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ],
          );
        }
        else if (state is FetchFutureMovieFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage,);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
