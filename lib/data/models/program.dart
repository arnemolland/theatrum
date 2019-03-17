import 'package:theatrum/utils/date_converter.dart';
import 'models.dart';

class Program {
  final DateTime date;
  final List<Movie> movies;
  final Cinema cinema;

  Program({this.date, this.movies, this.cinema});
  
  static Program fromJson(Map<String, dynamic> json, Cinema cinema) {
    var list = json['movies'] as List;
    List<Movie> movies = list.map((movie) => Movie.fromJson(movie)).toList();
    return Program(
      date: DateConverter.dateFromFilmweb(json['shortDate']),
      movies: movies,
      cinema: cinema
    );
  }
}
