import 'package:flutter/material.dart';
import 'package:flutter_training/movie_database/constants/constants.dart';
import 'package:flutter_training/movie_database/providers/movie_provider.dart';
// import 'package:flutter_training/movie_database/widgets/movie_item.dart';
import 'package:flutter_training/movie_database/widgets/movie_item_2.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context, listen: false).getMovies();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child) => myMovieList2(context, movieProvider, child),
      ),
    );
  }

  ListView myMovieList2(context, movieProvider, child) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, index) => MovieItem2(movieProvider.movieList[index]),
    itemCount: movies.length,);
  }

  ListView myMovieList1() {
    return ListView(
      padding: EdgeInsets.all(8),
      children: movies.map((movie) => ListTile(
        title: Text(movie.name),
        subtitle: Text(movie.category),
        trailing: Text('${movie.rating}'),
        leading: CircleAvatar(),
      )).toList(),
    );
  }
}
