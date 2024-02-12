import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/category_model.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen(
      {super.key,
      required this.onToggleFavMeals,
      required this.favMealList,
      required this.filtersMeals});

  final void Function(MealModel meal) onToggleFavMeals;
  final List<MealModel> favMealList;
  final List<MealModel> filtersMeals;

  void _onTapCategoryCard(BuildContext context, CategoryModel category) {
    final filteredMeals = filtersMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          mealsList: filteredMeals,
          onToggleFavMeals: onToggleFavMeals,
          favMealList: favMealList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryCard(
            category: category,
            onTapcategory: () => _onTapCategoryCard(context, category),
          ),
      ],
    );
  }
}
