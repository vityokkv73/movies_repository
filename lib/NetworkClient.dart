import 'package:http/http.dart' as http;
import 'package:movies_repository/MoviesListResult.dart';
import 'package:movies_repository/Error.dart';
import 'dart:convert';

class NetworkClient {
  final key = "b0fc4c075392638bf2e7cdd923e9e42c";
  final baseUrl = "https://api.themoviedb.org/3";

  getTopRatedMovies(int page, successFunc(MoviesListResult moviesListResult), errorFunc(Error error)) {
    var url = "$baseUrl/movie/top_rated?page=$page&api_key=$key";
    http.post(url).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        successFunc(MoviesListResult.fromJson(
            json.decode(response.body) as Map<String, dynamic>));
      } else {
        errorFunc(Error.fromJson(json.decode(response.body) as Map<String, dynamic>));
      }
    });
  }
}
