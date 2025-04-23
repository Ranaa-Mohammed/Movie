import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'listView_ComingSoon.dart';

class CustomComingSoon extends StatelessWidget {
  const CustomComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Coming Soon',
            style: Styles.textStyle18.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10,),
        const ListviewComingSoon(),
      ],
    );
  }
}
