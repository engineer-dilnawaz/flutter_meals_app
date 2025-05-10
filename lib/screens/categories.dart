import 'package:flutter/material.dart';
import 'package:flutter_meals_app/data/dummy_data.dart';
import 'package:flutter_meals_app/models/category.dart';
import 'package:flutter_meals_app/screens/meals.dart';
import 'package:flutter_meals_app/widgets/categories_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        dummyMeals
            .where((meal) => meal.categories.contains(category.id))
            .toList();
    // valid but not used commonly
    // Navigator.push(context, MaterialPageRoute(builder: (ctx)=> MealsScreen(title: 'Something...', meals: [])));

    // most commonly used
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(title: category.title, meals: filteredMeals),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick your category')),
      body: GridView(
        padding: EdgeInsets.all(24.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        children: [
          // availableCategories.map((category)=>CategoriesGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoriesGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
