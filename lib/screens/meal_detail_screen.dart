import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  const MealDetailScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(BuildContext ctx, String title, Color color) {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        0.0,
        25.0,
        0.0,
        0.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildListView(BuildContext ctx, List<String> list, Color color) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var element in list)
            Card(
              color: color.withOpacity(0.7),
              margin: const EdgeInsets.all(5.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  element,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final String mealId = routeArg['id'] as String;
    final Color color = routeArg['color'] as Color;
    final Meal meal =
        dummyMeals.firstWhere((mealItem) => mealItem.id == mealId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          meal.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl),
            ),
            buildSectionTitle(
              context,
              'Ingredients',
              color,
            ),
            buildListView(
              context,
              meal.ingredients,
              color,
            ),
            buildSectionTitle(
              context,
              'Steps',
              color,
            ),
            buildListView(
              context,
              meal.steps,
              color,
            ),
          ],
        ),
      ),
    );
  }
}
