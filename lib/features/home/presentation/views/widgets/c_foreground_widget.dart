import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Statemanagment cubit
import '../../model_views/home_cubit/home_cubit.dart';
// custom widgets
import 'c_movie_display_widget.dart';
import 'c_search_appbar.dart';

class CForegroundWidget extends StatelessWidget {
  const CForegroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    print(data.getDropdownButtonValue);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding:
              EdgeInsets.fromLTRB(0, data.getDeviceWidth(context) * 0.02, 0, 0),
          width: data.getDeviceWidth(context) * 0.88,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              CSearchAppbar(),
              SizedBox(height: 15),
              CMovieDisplayPopular(),
            ],
          ),
        );
      },
    );
  }
}
