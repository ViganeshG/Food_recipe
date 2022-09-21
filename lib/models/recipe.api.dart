import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https(
        'yummly2.p.rapidapi.com', '/feeds/list', {"limit": '24', "start": '0'});
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': 'a71a35eabdmsh3ec3228b65d7eebp16790bjsn6126b964df6c',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com'
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['description']);
    }
    return Recipe.recipesFromSnapshot(_temp);
  }
}
