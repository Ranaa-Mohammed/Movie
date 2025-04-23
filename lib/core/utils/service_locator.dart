import 'package:get_it/get_it.dart';
import 'package:movie/core/utils/api_services.dart';
import 'package:movie/core/utils/dio_factory.dart';
import 'package:movie/feature/home/data/repos/home_repo_implement.dart';
import 'package:dio/dio.dart';
import 'package:movie/feature/search/data/repos/search_repo_implement.dart';


final getIt = GetIt.instance;

void setUpService (){
  getIt.registerSingleton<ApiService>(ApiService(DioFactory.getDio()));
  getIt.registerSingleton<HomeRepoImplement>(HomeRepoImplement(getIt.get<ApiService>(),));
  getIt.registerSingleton<SearchRepoImplement>(SearchRepoImplement(getIt.get<ApiService>(),));
}