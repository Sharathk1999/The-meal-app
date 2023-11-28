import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_meal_app/model/meal_model.dart';

class MealRepository {
  Future<MealModel> getMeal() async {
    String url = "https://www.themealdb.com/api/json/v1/1/random.php";
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    return MealModel.fromJson(jsonDecode(response.body));
  }
}
