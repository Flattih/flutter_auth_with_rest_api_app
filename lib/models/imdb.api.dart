import 'dart:convert';
import 'imdb.dart';
import 'package:http/http.dart' as http;



class ImdbApi {
  static Future<List<Imdb>> getRecipe() async {
    var uri =
        Uri.https('imdb8.p.rapidapi.com', '/title/find', {"q": "game of thr"});
    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "imdb8.p.rapidapi.com",
      "x-rapidapi-key": "temporarily disabled",
      "useQueryString": "true",
    });
    Map data = jsonDecode(response.body);
    List _temp = [];
    for (var i in data["results"]) {
      _temp.add(i);
    }
    return Imdb.imdbFromSnapshot(_temp);
  }
}
