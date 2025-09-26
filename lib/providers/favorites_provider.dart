import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals/models/meal.dart';

//provider which allows us to change data
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {

      //.where creates a new list based on the condition we send to it(removing a meal)
      state = state.where((m) => m.id != meal.id).toList();
      return false; //we return false if the item is removed
    } else {

      //...state pulls up all the existing meals and add them to new list and
      // with meal we add a new meal to the new list
      state = [...state, meal];
      return true; //we return true if the item is added
    }
  }
}

//more complex provider - dynamic data
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
      return FavoriteMealsNotifier();
    });
