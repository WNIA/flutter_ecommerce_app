

import 'package:flutter/material.dart';
import 'package:flutter_training/movie_database/constants/constants.dart';
import 'package:flutter_training/movie_database/models/movie_model.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movieList = [];

  List<Movie> get movieList => _movieList;

  void getMovies() => _movieList =  movies;

  void deleteMovie(Movie movie){
    _movieList.removeWhere((element) => movie == element);
    notifyListeners();
  }
}