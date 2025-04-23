import 'package:flutter/material.dart';
import 'package:movie/feature/splash/presentation/views/widgets/body_splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: BodySplash(),
      ),
    );
  }
}
