import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie/core/widgets/c_no_image_provided_widget.dart';

import '../../../../../core/utils/helper.dart';
import '../../../data/models/movie_model.dart';
import '../../model_views/home_cubit/home_cubit.dart';

class MovieListView extends StatelessWidget {
  final List<MovieModel> list;
  const MovieListView({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = BlocProvider.of<HomeCubit>(context);
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemBuilder: (context, index) =>
            movieListItem(context, data, list[index]),
        itemCount: list.length,
      ),
    );
  }

  // success widget
  Widget movieListItem(BuildContext context, HomeCubit data, MovieModel model) {
    return Row(
      children: [
        // image section
        GestureDetector(
          onTap: () {
            data.setImagePosterPath = Helper.getImagePath(model.backdropPath!);
          },
          child: SizedBox(
            height: data.getDeviceHeight(context) * 0.24,
            width: data.getDeviceWidth(context) * 0.3,
            child: model.backdropPath == null
                ? const CNoImageProvidedWidget()
                : CachedNetworkImage(
                    imageUrl: Helper.getImagePath(model.backdropPath!),
                    fit: BoxFit.cover,
                    placeholder: (context, name) => Helper.getShimmer(
                      width: data.getDeviceWidth(context) * 0.3,
                      height: data.getDeviceHeight(context) * 0.24,
                    ),
                  ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: data.getDeviceWidth(context) * 0.47,
                    child: Text(
                      model.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: data.getDeviceWidth(context) * 0.02),
                  SizedBox(
                    width: data.getDeviceWidth(context) * 0.07,
                    child: FittedBox(
                      child: Text(
                        model.voteAverage!.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: data.getDeviceHeight(context) * 0.003),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      '${model.originalLanguage} | ',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Text(
                      Helper.getDate(model.releaseDate),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: data.getDeviceHeight(context) * 0.008),
              SizedBox(
                width: data.getDeviceWidth(context) * 0.56,
                child: Text(
                  '${model.overview}',
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
