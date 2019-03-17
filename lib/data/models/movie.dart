import 'models.dart';

class Movie {
  final String id;
  final String title;
  final String movieId;
  final String genre;
  final String ageRestriction;
  final String length;
  final List<Show> shows;
  final int articleId;
  final String articleUrl;
  final int trailerId;
  final String trailerUrl;
  final String images;
  final bool isClubMovie;
  final bool isVersioned;

  Movie(
      {this.id,
      this.title,
      this.movieId,
      this.genre,
      this.ageRestriction,
      this.shows,
      this.articleId,
      this.articleUrl,
      this.trailerId,
      this.trailerUrl,
      this.images,
      this.isClubMovie,
      this.isVersioned,
      this.length});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'movieId': movieId,
      'genre': genre,
      'ageRestriction': ageRestriction,
      'shows': shows,
      'isVersioned': isVersioned,
      'length': length,
      'articleId':articleId,
      'articleUrl':articleUrl,
      'trailerId':trailerId,
      'trailerUrl': trailerUrl,
      'images': this.images,
      'isClubMovie':isClubMovie,
    };
  }

  /// Warning: Filmweb's APIs are software gore.
  static Movie fromJson(Map<String, dynamic> json) {
    var list = json['shows'] as List;
    List<Show> shows = list.map((show) => Show.fromJson(show)).toList();
    return Movie(
        title: json['movieTitleAllVersions'],
        movieId: json['movieId'],
        genre: json['genre'],
        ageRestriction: json['sensur'],
        shows: shows,
        isVersioned: json['isVersioned'],
        length: json['lengde'],
        articleId: json['articleId'],
        articleUrl: json['articleUrl'],
        trailerId: json['trailerId'],
        trailerUrl: json['trailerUrl'],
        images: json['respImgParams'],
        isClubMovie: json['isKinoKlubbMovie']);
  }
}
