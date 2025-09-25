import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/main.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> favoriteMeals = [];
  
  void _toggleMealFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeals.contains(meal);
    
    if(isExisting){
      favoriteMeals.remove(meal);
      favoriteMeals.add(meal);
    }
  }

  //this updates the selected page from the index it gets (int index)
  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus,);
    var activePageTitle = 'Categories';

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: [], onToggleFavorite: (Meal meal) {  },);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.set_meal),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ]),
    );
  }
}
