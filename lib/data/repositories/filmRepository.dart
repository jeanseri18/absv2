import 'dart:convert';

import 'package:abidjanstreaming/data/model/ResultModel.dart';
import 'package:abidjanstreaming/data/model/film.dart';
import 'package:abidjanstreaming/data/services/ApiService.dart';
import 'package:abidjanstreaming/data/services/appurl.dart';

class ProductRepository {
  static APIService<List<Film>> load(endpoint) {
    return APIService(
        url: Uri.http(AppUrl.baseUrl, endpoint),
        // url: url,
        parse: (response) {
          final parsed = json.decode(response.body);
          final dataJson = ResultModel.fromJSON(parsed);
          var filmList = dataJson.responsedata as List;
          List<Film> films = filmList.map((e) => Film.fromJson(e)).toList();
          return films;
        });
  }
}
