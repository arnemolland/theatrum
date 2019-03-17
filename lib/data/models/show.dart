import 'package:meta/meta.dart';
import 'models.dart';

class Show {
  String id;
  String edi;
  String showStart;
  String showStop;
  int categoryId;
  String categoryDesc;
  String trailerUrl;
  String theater;
  String screen;
  String buyUrl;

  int seatseft;

  bool is2D;
  bool is3D;
  bool isOrig;
  bool isNorwegian;
  bool isWithoutSub;
  bool hasLangSpec;

  Movie movie;
  Cinema cinema;

  Show(
      {this.id,
      this.edi,
      this.showStart,
      this.showStop,
      this.categoryId,
      this.categoryDesc,
      this.trailerUrl,
      this.theater,
      this.screen,
      this.buyUrl,
      this.seatseft,
      this.is3D,
      this.is2D,
      this.isOrig,
      this.isNorwegian,
      this.isWithoutSub,
      this.hasLangSpec,
      this.movie,
      this.cinema});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'edi': edi,
      'showStart': showStart,
      'showStop': showStop,
      'categoryId': categoryId,
      'categoryDesc': categoryDesc,
      'trailerUrl': trailerUrl,
      'theater': theater,
      'screen': screen,
      'buyUrl': buyUrl,
      'seatsLeft': seatseft,
      'is3D': is3D,
      'is2D': is2D,
      'isOrig': isOrig,
      'isNorwegian': isNorwegian,
      'isWithotSub': isWithoutSub,
      'hasLangSpec': hasLangSpec,
      'movie': movie,
      'cinema': cinema
    };
  }

  static Show fromJson(Map<String, dynamic> json) {
    return Show(
        id: json['id'],
        edi: json['edi'],
        showStart: json['showStart'],
        showStop: json['showStop'],
        categoryId: json['categoryId'],
        categoryDesc: json['categoryDesc']);
  }
}
