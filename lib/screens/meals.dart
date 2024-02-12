import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key,
      this.title,
      required this.mealsList,
      required this.onToggleFavMeals,
      required this.favMealList});

  final String? title;
  final List<MealModel> mealsList;
  final void Function(MealModel meal) onToggleFavMeals;
  final List<MealModel> favMealList;

  @override
  Widget build(BuildContext context) {
    final content = mealsList.isNotEmpty
        ? ListView.builder(
            itemCount: mealsList.length,
            itemBuilder: (ctx, i) => MealItem(
                meal: mealsList[i],
                onToggleFavMeals: onToggleFavMeals,
                favMealList: favMealList),
          )
        : const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Oops... Nothing found!",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 5),
                Text("Try selecting a different category."),
              ],
            ),
          );

    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
