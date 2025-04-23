import 'package:flutter/material.dart';
import 'package:movie/feature/search/presentation/views/widgets/gridView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/custom_errorWidget.dart';
import '../../../../../core/utils/styles.dart';
import '../../manger/search_cubit/search_cubit.dart';
import '../../manger/search_cubit/search_states.dart';
import 'custom_search_textField.dart';

class BodySearch extends StatelessWidget {
  const BodySearch({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomSearchTextField(),
            BlocBuilder<SearchMovieCubit, SearchStates>(
              builder: (context, state) {
            if(state is SearchSuccess){
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16,),
                    const Text('Search Result', style: Styles.textStyle18,),
                    const SizedBox(height: 16,),
                    CustomGridView(movieModel: state.search,),
                  ],
                );
              }else if(state is SearchFailure){
              return CustomErrorWidget(errorMessage: state.errMessage);
            }else{
              return const Center(child: CircularProgressIndicator());
            }
            }
            ),
          ],
        ),
      ),
    );
  }
}
