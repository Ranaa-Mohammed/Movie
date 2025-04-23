import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/service_locator.dart';
import '../../feature/home/data/repos/home_repo_implement.dart';
import '../../feature/home/presentation/manger/fetchFuture_movie_cubit/fetchFuture_movie_cubit.dart';
import '../../feature/home/presentation/views/details_movie.dart';
import '../../feature/home/presentation/views/home_view.dart';
import '../../feature/splash/presentation/views/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppRouter {
  static const String kHomeView = '/homeView';
  static const String kDetailsMovie = '/detailsMovie';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        // الباث هنا نقطه البدايه بتاعتي
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const Splash();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return  HomeView();
        },
      ),
      GoRoute(
        name: AppRouter.kDetailsMovie,
        path: "$kDetailsMovie/:movieId",
        builder: (BuildContext context, GoRouterState state) {
         // print("yyyyy id " );
          final String? movieId =  state.pathParameters["movieId"];
         //print("reeeeeee id :$movieId" );
          return  BlocProvider(
              create: (context) => FetchFutureMovieCubit(getIt.get<HomeRepoImplement>())..detailsMovieCubit(
                movieId: movieId ?? "0",
              ),
              child: DetailsMovie( movieID: movieId ?? "0",)
          );
        },
      ),
    ],
  );
}