
import 'package:flutter/material.dart';
import 'package:movie/core/utils/assets.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetsData.logo,
          height: 100,
          width: 100,
        ),
      ],
    );
  }
}
