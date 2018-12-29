import 'package:flutter/material.dart';
import 'package:movies_repository/MovieBrief.dart';

class MovieScreen extends StatefulWidget {
  final MovieBrief movie;

  MovieScreen(this.movie);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState(movie);
  }
}

@override
class _MyHomePageState extends State<MovieScreen> {
  MovieBrief movie;

  _MyHomePageState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Scrollable(viewportBuilder: (context, viewportOffset) {
          return Column(children: <Widget>[
            Image.network(
                'http://image.tmdb.org/t/p/w780/${movie.backdropPath}',
                fit: BoxFit.fitWidth),
            Text(movie.overview)
          ]);
        }));
  }
}
