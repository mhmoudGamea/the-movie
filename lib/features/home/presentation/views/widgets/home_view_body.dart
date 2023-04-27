import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Statemanagment cubit
import '../../model_views/home_cubit/home_cubit.dart';
// custom widgetss
import 'c_background_image.dart';
import 'c_foreground_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    return SizedBox(
      height: data.getDeviceHeight(context),
      width: data.getDeviceWidth(context),
      child: Stack(
        alignment: Alignment.center,
        children: const [
          CBackgroundImage(),
          CForegroundWidget(),
        ],
      ),
    );
  }
}
