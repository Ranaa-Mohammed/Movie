import 'package:flutter/material.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import '../../../../../core/utils/constans.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/ItemCachedImage.dart';
import '../../../../home/presentation/views/widgets/Rating.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.movieModel});
final List<MovieModel> movieModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 3,
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              childAspectRatio: 1 / 1.78,
            ),
             itemCount: movieModel.length,
            itemBuilder: (BuildContext context, int index) {
              return  GestureDetector(
                onTap: ()
                {
                  // context.pushNamed(AppRouter.kDetailsMovie, pathParameters: {"movieId": movieModel[index].id.toString()});

                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ItemCachedImage(
                            image: '$apiImage${movieModel[index].posterPath}'
                        ),
                        SizedBox(height: 8,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Rating(
                              rating: movieModel[index].voteAverage ?? 0,
                            ),
                            SizedBox(height: 5,),
                            Text(movieModel[index].title ?? '', style: Styles.textStyle14, overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
