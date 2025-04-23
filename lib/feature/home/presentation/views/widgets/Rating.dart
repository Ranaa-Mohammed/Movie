import 'package:flutter/material.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';

import '../../../../../core/utils/styles.dart';

class Rating extends StatelessWidget {
  const Rating({super.key,  required this.rating});

  final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Icon(Icons.star, color: Colors.amber,),
      const SizedBox(width: 5,),
      Text( rating.toString(), style: Styles.textStyle16,),
    ],);
  }
}
//state.movie[index].voteAverage.toString()