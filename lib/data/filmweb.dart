import 'models/models.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Filmweb {
  static final endpoint = 'https://filmweb.no/template_v2/ajax';

  Future<Program> fetchProgram(
      {String location, String date, @required Cinema cinema}) async {
    final response = await get(
        '$endpoint/json_program.jsp?location=${cinema.location ?? location}');

    final decoded = json.decode(response.body);

    return Program.fromJson(decoded['days'][0], cinema);
  }

  Future<List<Cinema>> getCinemas() async {
    final response = await get('$endpoint/json_locations_simple.jsp');
    final decoded = json.decode(response.body);
    final list = decoded as List;
    return list.map((cinema) => Cinema.fromJson(cinema)).toList();
  }
}
