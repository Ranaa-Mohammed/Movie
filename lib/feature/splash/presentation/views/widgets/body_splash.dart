import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie/core/utils/app_router.dart';
import 'package:movie/core/utils/assets.dart';

class BodySplash extends StatefulWidget {
  const BodySplash({super.key});

  @override
  State<BodySplash> createState() => _BodySplashState();
}

class _BodySplashState extends State<BodySplash> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigatorToHome();
  }
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SlideTransition(
          position: animation,
          child: Image.asset(AssetsData.logo),
        ),
      ],
    );
  }


  void initSlidingAnimation (){
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000) );
    animation = Tween<Offset>(begin: const Offset(0, 15), end: Offset.zero).animate(animationController);
    animationController.forward();
  }

  void navigatorToHome() async{
    await Future.delayed(const Duration(seconds: 5),
          () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );

  }
}
