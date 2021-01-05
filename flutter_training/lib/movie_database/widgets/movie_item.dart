import 'package:flutter/material.dart';
import 'package:flutter_training/movie_database/models/movie_model.dart';

class MovieItem extends StatelessWidget {
final Movie movies;
MovieItem(this.movies);
@override
Widget build(BuildContext context) {
return ListTile(
title: Text(movies.name),
subtitle: Text(movies.category),
trailing: Text('${movies.rating}'),
leading: CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/posters/${movies.image}'),),
);
}
}
