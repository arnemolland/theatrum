import 'dart:collection';
import 'package:theatrum/data/models/models.dart';

/// This object handles the search operation in the app. When it is initialized,
/// receiving the full list of entries as input, the object fills in a [SplayTreeMap],
/// i.e. a self-balancing binary tree.
class CinemaSearchManager {
  static final CinemaSearchManager _cinemaSearchManager =
      CinemaSearchManager._internal();

  /// This map creates a dictionary for every possible substring that each of the
  /// [Cinema] labels have, and uses a [Set] as a value, allowing for multiple
  /// entires to be stored for a single key.
  final SplayTreeMap<String, Set<Cinema>> _queryMap =
      SplayTreeMap<String, Set<Cinema>>();

  /// Constructor definition.
  CinemaSearchManager._internal();

  /// Factory constructor that will perform the initialization, and return the reference
  /// the _CinemaSearchManager (constructing it if called a first time.).
  factory CinemaSearchManager.init([List<Cinema> entries]) {
    if (entries != null) {
      _cinemaSearchManager._fill(entries);
    }
    return _cinemaSearchManager;
  }

  _fill(List<Cinema> entries) {
    /// Sanity check.
    _queryMap.clear();

    /// Fill the map with all the possible searchable substrings.
    /// This operation is O(n^2), thus very slow, and performed only once upon initialization.
    for (Cinema e in entries) {
      String label = e.searchLabel;
      e.theaters.forEach((theater) => label += theater.name);
      int len = label.length;
      for (int i = 0; i < len; i++) {
        for (int j = i + 1; j <= len; j++) {
          String substring = label.substring(i, j).toLowerCase();
          if (_queryMap.containsKey(substring)) {
            Set<Cinema> labels = _queryMap[substring];
            labels.add(e);
          } else {
            _queryMap.putIfAbsent(substring, () => Set.from([e]));
          }
        }
      }
    }
  }

  /// Use the [SplayTreeMap] query function to return the full [Set] of results.
  /// This operation amortized logarithmic time.
  Set<Cinema> performSearch(String query) {
    if (_queryMap.containsKey(query))
      return _queryMap[query];
    else if (query.isNotEmpty) {
      return Set();
    }
    Iterable<String> keys = _queryMap.keys;
    Set<Cinema> res = Set();
    for (String k in keys) {
      res.addAll(_queryMap[k]);
    }
    return res;
  }
}
