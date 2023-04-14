import 'package:flutter/material.dart';

import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    super.key,
    required this.id,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 15.0;

    void selectCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName, arguments: {
        'id': id,
        'title': title,
        'color': color,
      });
    }

    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
