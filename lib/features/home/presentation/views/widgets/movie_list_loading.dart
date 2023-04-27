import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/helper.dart';
import '../../model_views/home_cubit/home_cubit.dart';

class MovieListLoading extends StatelessWidget {
  const MovieListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemBuilder: (context, index) => movieListItemLoading(context, data),
        itemCount: 20,
      ),
    );
  }

  // loading widget
  Widget movieListItemLoading(BuildContext context, HomeCubit data) {
    return Row(
      children: [
        // image section
        SizedBox(
          height: data.getDeviceHeight(context) * 0.24,
          width: data.getDeviceWidth(context) * 0.3,
          child: Helper.getShimmer(
            width: data.getDeviceWidth(context) * 0.3,
            height: data.getDeviceHeight(context) * 0.24,
          ),
        ),
        SizedBox(width: data.getDeviceWidth(context) * 0.02),
        // column section[Row(title, voteAverage), Row(lang, date), Text(description)]
        SizedBox(
          height: data.getDeviceHeight(context) * 0.24,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              SizedBox(
                width: data.getDeviceWidth(context) * 0.56,
                height: data.getDeviceHeight(context) * 0.03,
                child: Helper.getShimmer(
                  width: data.getDeviceWidth(context) * 0.56,
                  height: data.getDeviceHeight(context) * 0.03,
                ),
              ),
              SizedBox(height: data.getDeviceHeight(context) * 0.003),
              // date
              SizedBox(
                width: data.getDeviceWidth(context) * 0.3,
                height: data.getDeviceHeight(context) * 0.02,
                child: Helper.getShimmer(
                  width: data.getDeviceWidth(context) * 0.3,
                  height: data.getDeviceHeight(context) * 0.02,
                ),
              ),
              SizedBox(height: data.getDeviceHeight(context) * 0.008),
              // description
              Expanded(
                child: SizedBox(
                  width: data.getDeviceWidth(context) * 0.56,
                  child: ListView.separated(
                    itemCount: 7,
                    itemBuilder: (context, index) => SizedBox(
                      width: data.getDeviceWidth(context) * 0.56,
                      height: data.getDeviceHeight(context) * 0.01,
                      child: Helper.getShimmer(
                        width: data.getDeviceWidth(context) * 0.56,
                        height: data.getDeviceHeight(context) * 0.01,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: data.getDeviceHeight(context) * 0.01),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
