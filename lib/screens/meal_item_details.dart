import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';

class MealItemDetails extends StatelessWidget {
  const MealItemDetails({
    super.key,
    required this.meal,
    required this.onToggleFavMeals,
    required this.favMealList,
  });

  final MealModel meal;
  final void Function(MealModel meal) onToggleFavMeals;
  final List<MealModel> favMealList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () => onToggleFavMeals(meal),
            icon: favMealList.contains(meal)
                ? Icon(
                    Icons.star,
                    color: Colors.red[900],
                  )
                : const Icon(Icons.star_border),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            const SizedBox(height: 20),
            const Text(
              "Ingredients",
              style: TextStyle(fontSize: 22, color: Colors.pink),
            ),
            const SizedBox(height: 7),
            for (final ingredient in meal.ingredients) Text(ingredient),
            const SizedBox(height: 25),
            const Text(
              "Steps",
              style: TextStyle(fontSize: 22, color: Colors.pink),
            ),
            const SizedBox(height: 7),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(step),
              ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
