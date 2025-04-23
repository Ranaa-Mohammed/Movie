import 'package:flutter/material.dart';
import '../../manger/search_cubit/search_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchTextField extends StatelessWidget {
   CustomSearchTextField({super.key});

  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        context.read<SearchMovieCubit>().searchCubit(query: value);
      },
      controller: searchController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),  borderRadius: BorderRadius.circular(16),),
        hintText: 'search',
        suffixIcon: IconButton(
          onPressed: (){},
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              Icons.search,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
