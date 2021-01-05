import 'package:flutter/material.dart';
import 'package:flutter_training/movie_database/models/movie_model.dart';
import 'package:flutter_training/movie_database/pages/movie_details_page.dart';
import 'package:flutter_training/movie_database/providers/movie_provider.dart';
import 'package:flutter_training/movie_database/styles/text_styles.dart';
import 'package:provider/provider.dart';

class MovieItem2 extends StatefulWidget {
  final Movie movie;

  MovieItem2(this.movie);

  @override
  _MovieItem2State createState() => _MovieItem2State();
}

class _MovieItem2State extends State<MovieItem2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsPage(widget.movie)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5),
          ],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  child: Hero(
                    tag: widget.movie.id,
                    child: Image.asset(
                      'assets/posters/${widget.movie.image}',
                      width: double.infinity,
                      height: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                    child: IconButton(
                        icon: Icon(
                            Icons.favorite_border_outlined,
                            size: 50, color: Colors.white),
                        onPressed: () {})),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width*0.75,
                    padding: const EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.5),
                    child: FittedBox(
                      // fit: BoxFit.fitWidth,
                      child: Text(
                        widget.movie.name,
                        style: movieTitleTxt,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                    bottom: 10,
                    child: IconButton(
                      onPressed: (){
                        Provider.of<MovieProvider>(context, listen: false).deleteMovie(widget.movie);
                      },
                  icon: Icon(Icons.delete, color: Colors.purple[900], size: 40,),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.movie.category, style: movieRowInfoItem),
                  Text('${widget.movie.releaseYear}', style: movieRowInfoItem),
                  Text('${widget.movie.rating}', style: movieRowInfoItem)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
