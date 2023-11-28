// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealModel {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String image;
  final String youtubeUrl;
  final List<Ingredients> ingredients;
  MealModel({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.image,
    required this.youtubeUrl,
    required this.ingredients,
  });

  MealModel.fromJson(Map<String, dynamic> json)
      : id = json['meals'][0]['idMeal'],
        name = json['meals'][0]['strMeal'],
        category = json['meals'][0]['strCategory'],
        area = json['meals'][0]['strArea'],
        instructions = json['meals'][0]['strInstructions'],
        image = json['meals'][0]['strMealThumb'],
        youtubeUrl = json['meals'][0]['strYoutube'],
        ingredients = List.generate(
          20,
          (index) => Ingredients(
            name: json['meals'][0]['strIngredient${index + 1}'],
            measure: json['meals'][0]['strMeasure1'],
          ),
        );
}

class Ingredients {
  final String name;
  final String measure;
  Ingredients({
    required this.name,
    required this.measure,
  });
}
