part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// popular states section
class HomePopularLoading extends HomeState {}

class HomePopularSuccess extends HomeState {
  final List<MovieModel> popularList;
  HomePopularSuccess({required this.popularList});
}

class HomePopularFailure extends HomeState {
  final String error;
  HomePopularFailure({required this.error});
}

// upcoming states section
class HomeUpcomingLoading extends HomeState {}

class HomeUpcomingSuccess extends HomeState {
  final List<MovieModel> upcomingList;
  HomeUpcomingSuccess({required this.upcomingList});
}

class HomeUpcomingFailure extends HomeState {
  final String error;
  HomeUpcomingFailure({required this.error});
}

// search states section
class HomeSearchLoading extends HomeState {}

class HomeSearchSuccess extends HomeState {
  final List<MovieModel> searchResultList;
  HomeSearchSuccess({required this.searchResultList});
}

class HomeSearchFailure extends HomeState {
  final String error;
  HomeSearchFailure({required this.error});
}

// background image poster
class ImagePosterPathChanged extends HomeState {}

// drop down button status
class DorpdownButtonValueChanged extends HomeState {}
