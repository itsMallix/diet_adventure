import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:diet_app/model/m_food.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
      "limit": "10",
      "start": "0",
      "tag":
          "list.recipe.search_based:fq:diet_inclusion_s_mv:387\^Lacto\-ovo\ vegetarian"
    });

    final response = await http.get(
      uri,
      headers: {
        'X-RapidAPI-Key': '8fa1434fbbmshcf222fb2427469bp1b2110jsn69625e7a445f',
        'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
        "useQueryString": "true"
      },
    );

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
      print("here...");
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
