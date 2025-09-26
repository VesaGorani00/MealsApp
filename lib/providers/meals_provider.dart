import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

//basic provider - static data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});