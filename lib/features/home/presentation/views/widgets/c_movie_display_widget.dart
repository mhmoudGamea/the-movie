import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/features/home/presentation/views/widgets/movie_list_loading.dart';
import 'package:the_movie/features/home/presentation/views/widgets/movie_list_view.dart';

import '../../model_views/home_cubit/home_cubit.dart';

class CMovieDisplayPopular extends StatelessWidget {
  const CMovieDisplayPopular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomePopularFailure) {
          return const SizedBox(
            child: Center(child: Text('Errrrrrrrrrrrrrrrrrror')),
          );
        } else if (state is HomePopularLoading ||
            state is HomeUpcomingLoading ||
            state is HomeSearchLoading) {
          return const MovieListLoading();
        } else {
          if (state is HomePopularSuccess || state is ImagePosterPathChanged) {
            return MovieListView(list: data.getPopularList);
          } else if (state is HomeUpcomingSuccess ||
              state is ImagePosterPathChanged) {
            return MovieListView(list: data.getUpcomingList);
          } else {
            return MovieListView(list: data.getSearchList);
          }
        }
      },
    );
  }
}
