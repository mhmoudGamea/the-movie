import 'package:dartz/dartz.dart';
import 'package:the_movie/core/error/failure.dart';
import '../models/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getPopular();
  Future<Either<Failure, List<MovieModel>>> getUpcoming();
  Future<Either<Failure, List<MovieModel>>> searchMovie(String searchTerm);
}
