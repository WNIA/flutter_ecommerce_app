import 'package:flutter/material.dart';
import 'package:flutter_training/movie_database/constants/constants.dart';
import 'package:flutter_training/movie_database/models/movie_model.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  MovieDetailsPage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Movie Details'),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            elevation: 10,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.name),
              background: Hero(tag: movie.id,
                child: Image.asset('assets/posters/${movie.image}',
                    width: double.infinity, height: 300, fit: BoxFit.cover),),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(
            [
              Card(
                  margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                  child: ListTile(
                      title: Text(movie.name),
                      subtitle: Text(movie.category),
                      trailing: Text('${movie.rating}'))),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(description),
              )
            ]
          )),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView(
      children: [
        Hero(
          tag: movie.id,
          child: Image.asset('assets/posters/${movie.image}',
              width: double.infinity, height: 300, fit: BoxFit.cover),
        ),
        Card(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: ListTile(
                title: Text(movie.name),
                subtitle: Text(movie.category),
                trailing: Text('${movie.rating}'))),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(description),
        )
      ],
    );
  }
}
