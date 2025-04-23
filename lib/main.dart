import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_router.dart';
import 'package:movie/core/utils/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/utils/service_locator.dart';


void main() {
   Bloc.observer = SimpleBlocObserver();
   setUpService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),

    );
  }
}

