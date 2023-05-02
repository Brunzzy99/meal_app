import 'package:flutter/material.dart';

import '../models/category.dart';
import '../models/meal.dart';
import './meals_screen.dart';
import '../data/dummy_data.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key, required this.onToggleFavorite, required this.availableMeals,
  });

  final List<Meal> availableMeals;

  final void Function(Meal meal) onToggleFavorite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealsScreen(
        title: category.title,
        meals: filteredMeals,
        onToggleFavorite: onToggleFavorite,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    double gridViewSpacing = 20.0;
    double gridViewPadding = 24.0;

    return GridView(
      padding: EdgeInsets.all(gridViewPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: gridViewSpacing,
        mainAxisSpacing: gridViewSpacing,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () => _selectCategory(context, category),
          )
      ],
    );
  }
}
