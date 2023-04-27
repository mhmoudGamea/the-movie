// dart packages
import 'dart:ui';
// flutter packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Statemanagment cubit
import '../../model_views/home_cubit/home_cubit.dart';

class CBackgroundImage extends StatelessWidget {
  const CBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          height: data.getDeviceHeight(context),
          width: data.getDeviceWidth(context),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: data.getImagePosterPath == null
                  ? const NetworkImage(
                      'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg')
                  : NetworkImage(data.getImagePosterPath!),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
        );
      },
    );
  }
}
