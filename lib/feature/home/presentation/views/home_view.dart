import 'package:flutter/material.dart';
import 'package:movie/feature/home/presentation/views/category_view.dart';
import 'package:movie/feature/home/presentation/views/widgets/body_home_view.dart';
import 'package:movie/feature/search/presentation/views/search_view.dart';

class HomeView extends StatefulWidget {
   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> screens = [
    BodyHomeView(),
    CategoryView(),
    SearchView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index){
           setState(() {
             currentIndex = index;
           });
          },
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
             label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'search',
            ),
          ]
      ),
    );
  }
}
