import 'dart:async';

class SearchBlocProvider {
  var dataSearch = [
    'Android',
    'iOS',
    'Java',
    'CSharp',
    'PHP',
    'Flutter',
    'Nodejs',
    'Ruby',
    'Kotlin',
    'Ruby',
    'Swift',
    'Golang',
    'Python'
  ];

  StreamController<List<String>> searchController =
      StreamController<List<String>>();

  search(String query) {
    if (query.isEmpty) {
      searchController.sink.add(dataSearch);
      return;
    }

    _filter(query).then((result) {
      // push value to Stream
      searchController.sink.add(result);
    });
  }

  Future<List<String>> _filter(String query) {
    var competer = Completer<List<String>>();
    List<String> result = [];

    dataSearch.forEach((value) {
      if (value.contains(query)) {
        result.add(value);
      }
    });

    competer.complete(result);
    return competer.future;
  }

  dispose() {
    searchController.close();
  }
}
