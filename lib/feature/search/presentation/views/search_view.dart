import 'package:flutter/material.dart';
import 'package:movie/core/utils/service_locator.dart';
import 'package:movie/feature/home/data/models/movie_model.dart';
import 'package:movie/feature/search/data/repos/search_repo_implement.dart';
import 'package:movie/feature/search/presentation/views/widgets/body_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/search_cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => SearchMovieCubit(getIt.get<SearchRepoImplement>())..getAllMovieCubit(),
            child: const BodySearch()
        ),
      ),
    );
  }
}
