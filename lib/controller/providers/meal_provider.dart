import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:the_meal_app/controller/repository/meal_repository.dart';

final mealProvider = FutureProvider((ref)  {
  if(kDebugMode) print("Calling meal provider");
  return MealRepository().getMeal();
});