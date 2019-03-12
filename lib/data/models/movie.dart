import 'models.dart';

class Movie {
  final String id;
  final String title;
  final String movieId;
  final String genre;
  final String ageRestriction;
  final List<Show> shows;
  bool isVersioned;

  Movie(
      {this.id,
      this.title,
      this.movieId,
      this.genre,
      this.ageRestriction,
      this.shows,
      this.isVersioned});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'movieId': movieId,
      'genre': genre,
      'ageRestriction': ageRestriction,
      'shows': shows,
      'isVersioned': isVersioned
    };
  }

  static Movie fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'],
        movieId: json['movieId'],
        genre: json['genre'],
        ageRestriction: json['ageRestriction'],
        shows: json['shows'] as List<Show>,
        isVersioned: json['isVersioned']);
  }
}
