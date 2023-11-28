import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal_app/controller/providers/meal_provider.dart';
import 'package:the_meal_app/utils/utils.dart';
import 'package:the_meal_app/views/recipe_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/vegetables-img.jpg'),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            height: MediaQuery.of(context).size.height * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\"Never eat the same boring meal twice with our endless meal combinations\"",
                  style: textStyle(
                    18,
                    Colors.black,
                    FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    // ignore: unused_result
                    ref.refresh(mealProvider);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecipeScreen(),
                      ),
                    );
                    
                  },
                  icon: Icon(
                    Icons.food_bank_rounded,
                    size: 45,
                    color: Colors.green.withOpacity(0.5),
                  ),
                  label: Text(
                    'Get Recipe',
                    style: textStyle(18, Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
