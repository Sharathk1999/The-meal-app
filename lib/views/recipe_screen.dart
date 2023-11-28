import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:the_meal_app/controller/providers/meal_provider.dart';
import 'package:the_meal_app/model/meal_model.dart';
import 'package:the_meal_app/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeScreen extends ConsumerWidget {
  const RecipeScreen({super.key});

  Future<void> _launchInBrowserView(Uri url, BuildContext context) async {
    try {
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    } catch (error) {
      
    context.mounted ?  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Video Unavailable',
            style: textStyle(14, Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          padding: const EdgeInsets.all(10),
          margin:const EdgeInsets.all(10),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.withOpacity(0.5),
        ),
      ): null ;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<MealModel> meal = ref.watch(mealProvider);
    return Scaffold(
        body: meal.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text(
          error.toString(),
        ),
      ),
      data: (recipe) {
        recipe.ingredients.removeWhere(
          (element) => element.name.isEmpty || element.name == '',
        );
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(recipe.image), fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: textStyle(
                          30,
                          Colors.black,
                          FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Chip(
                            side: BorderSide.none,
                            backgroundColor: Colors.green.withOpacity(0.2),
                            label: Center(
                              child: Text(
                                recipe.category,
                                style: textStyle(
                                    14, Colors.black, FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Chip(
                            side: BorderSide.none,
                            backgroundColor: Colors.green.withOpacity(0.2),
                            label: Center(
                              child: Text(
                                recipe.area,
                                style: textStyle(
                                    14, Colors.black, FontWeight.bold),
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: () async {
                              _launchInBrowserView(
                                  Uri.parse(recipe.youtubeUrl), context);
                            },
                            icon: const Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.white,
                            ),
                            label: Text(
                              "YouTube",
                              style: textStyle(14, Colors.white),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ingrediants",
                        style: textStyle(22, Colors.black, FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: recipe.ingredients
                              .map(
                                (ingredient) => Column(
                                  children: [
                                    Image(
                                      width: 95,
                                      height: 95,
                                      image: NetworkImage(
                                          "https://www.themealdb.com/images/ingredients/${ingredient.name}.png"),
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      ingredient.name,
                                      style: textStyle(
                                          20, Colors.black, FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      ingredient.measure,
                                      style: textStyle(
                                          18, Colors.grey, FontWeight.w500),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Steps:",
                        style: textStyle(22, Colors.black, FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        recipe.instructions,
                        style: textStyle(18, Colors.grey, FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
