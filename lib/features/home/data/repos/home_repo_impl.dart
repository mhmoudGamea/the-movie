import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie/core/utils/api_services.dart';
import 'package:the_movie/features/home/data/repos/home_repo.dart';

import '../../../../core/error/failure.dart';
import '../models/movie_model.dart';

class HomeRepoImpl extends HomeRepo {
  // get instance of the saved Apiservices
  final ApiServices _getApiServices = GetIt.instance.get<ApiServices>();

  @override
  Future<Either<Failure, List<MovieModel>>> getPopular() async {
    try {
      final response = await _getApiServices.get('movie/popular');
      List<MovieModel> popularList = [];
      response['results'].forEach((item) {
        popularList.add(MovieModel.fromJson(item));
      });
      return right(popularList);
    } on DioError catch (error) {
      return left(ServerSideError.fromDioError(error));
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getUpcoming() async {
    try {
      final response = await _getApiServices.get('movie/upcoming');
      // second way instead of initializing an array
      List<MovieModel> upcomingList =
          response['results'].map<MovieModel>((item) {
        return MovieModel.fromJson(item);
      }).toList();
      return right(upcomingList);
    } on DioError catch (error) {
      return left(ServerSideError.fromDioError(error));
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> searchMovie(
      String searchTerm) async {
    try {
      final response = await _getApiServices
          .get('search/movie', query: {'query': searchTerm});
      // second way instead of initializing an array
      List<MovieModel> searchResultList =
          response['results'].map<MovieModel>((item) {
        return MovieModel.fromJson(item);
      }).toList();
      return right(searchResultList);
    } on DioError catch (error) {
      return left(ServerSideError.fromDioError(error));
    } catch (error) {
      return left(ServerSideError(error.toString()));
    }
  }
}
