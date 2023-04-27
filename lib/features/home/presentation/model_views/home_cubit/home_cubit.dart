import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie/features/home/data/repos/home_repo_impl.dart';

import '../../../data/models/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  /* start the movie app ui */

  // background section
  String? _imagePosterPath;

  set setImagePosterPath(String? value) {
    _imagePosterPath = value;
    emit(ImagePosterPathChanged());
  }

  String? get getImagePosterPath {
    return _imagePosterPath;
  }

  // get device width and device hight
  late double deviceWidth;
  double getDeviceWidth(BuildContext context) {
    return deviceWidth = MediaQuery.of(context).size.width;
  }

  late double deviceHeight;
  double getDeviceHeight(BuildContext context) {
    return deviceHeight = MediaQuery.of(context).size.height;
  }

  // foreground section search app bar[search text field]
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get getSearchController {
    return _searchController;
  }

  // foreground section search app bar[drop down button]
  String? _dropDownButtonValue;

  set setDropdownButtonValue(String? value) {
    // print(value);
    if (value == 'popular') {
      _dropDownButtonValue = value;
      fetchPopular();
    } else if (value == 'upcoming') {
      _dropDownButtonValue = value;
      fetchUpcoming();
    }
  }

  String? get getDropdownButtonValue {
    if (_dropDownButtonValue == null) {
      return 'popular';
    }
    return _dropDownButtonValue;
  }

  /* start the movie app logic */
  final GetIt _getIt = GetIt.instance;

  // start get popular
  late List<MovieModel> _popularList;

  List<MovieModel> get getPopularList {
    return _popularList;
  }

  void fetchPopular() async {
    emit(HomePopularLoading());
    final response = await _getIt.get<HomeRepoImpl>().getPopular();
    response.fold((failure) {
      emit(HomePopularFailure(error: failure.errorMessage));
    }, (popularList) {
      _popularList = popularList;
      emit(HomePopularSuccess(popularList: popularList));
    });
  }

  // start get upcomming
  late List<MovieModel> _upcomingList;

  List<MovieModel> get getUpcomingList {
    return _upcomingList;
  }

  Future<void> fetchUpcoming() async {
    emit(HomeUpcomingLoading());
    final response = await _getIt.get<HomeRepoImpl>().getUpcoming();
    response.fold((failure) {
      emit(HomeUpcomingFailure(error: failure.errorMessage));
    }, (upcomingList) {
      _upcomingList = upcomingList;
      emit(HomeUpcomingSuccess(upcomingList: upcomingList));
    });
  }

  // start get search results

  late List<MovieModel> _searchList;

  List<MovieModel> get getSearchList {
    return _searchList;
  }

  Future<void> fetchSearchResults(String searchTerm) async {
    emit(HomeSearchLoading());
    final response = await _getIt.get<HomeRepoImpl>().searchMovie(searchTerm);
    response.fold((failure) {
      emit(HomeSearchFailure(error: failure.errorMessage));
    }, (searchResultList) {
      _searchList = searchResultList;
      emit(HomeSearchSuccess(searchResultList: searchResultList));
    });
  }
}
