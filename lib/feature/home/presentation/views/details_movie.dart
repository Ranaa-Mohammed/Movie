import 'package:flutter/material.dart';
import 'package:movie/feature/home/presentation/views/widgets/body_details_movie.dart';


class DetailsMovie extends StatelessWidget {

  const DetailsMovie({super.key, required this.movieID});
  final String movieID;
  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body: BodyDetailsMovie(),
    );
  }
}
