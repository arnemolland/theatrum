import 'models.dart';

class Cinema {
  String name;
  String location;
  String searchLabel;
  List<Theater> theaters;

  Cinema({this.name, this.location, this.searchLabel, this.theaters});

  static Cinema fromJson(Map<String, dynamic> json) {
    List<Theater> theaters = List<Theater>();
    if (json.containsKey('theaters')) {
      var list = json['theaters'] as List;
      theaters = list.map((theater) => Theater(name: theater)).toList();
    }

    return Cinema(
        name: json['label'],
        location: json['location'],
        searchLabel: json['searchLabel'],
        theaters: theaters);
  }
}
