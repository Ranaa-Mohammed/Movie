import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/feature/search/data/repos/search_repo.dart';
import 'package:movie/feature/search/presentation/manger/search_cubit/search_states.dart';

class SearchMovieCubit extends Cubit<SearchStates>{
  SearchMovieCubit(this.searchRepo) : super(SearchInitial() );

  final SearchRepo searchRepo;

  Future<void> getAllMovieCubit() async{
    emit(SearchLoading());
    var result = await searchRepo.getAllMovie();
    result.fold(
            (failure){
          emit(SearchFailure(failure.errorMessage));
        },
            (search){
          emit(SearchSuccess(search));
        }
    );
  }

  Future<void> searchCubit({required String query}) async{
    emit(SearchLoading());
    var result = await searchRepo.search(query: query);
    result.fold(
            (failure){
          emit(SearchFailure(failure.errorMessage));
        },
            (search){
          emit(SearchSuccess(search));
        }
    );
  }
}