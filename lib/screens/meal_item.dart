import 'package:flutter/material.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/meal_item_details.dart';
import 'package:meal_app/widgets/meal_item_metadata.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onToggleFavMeals,
    required this.favMealList,
  });

  final MealModel meal;
  final void Function(MealModel meal) onToggleFavMeals;
  final List<MealModel> favMealList;

  String convertTitleCase(String str) {
    return str[0].toUpperCase() + str.substring(1);
  }

  void onTapMealItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealItemDetails(
          meal: meal,
          onToggleFavMeals: onToggleFavMeals,
          favMealList: favMealList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: () => onTapMealItem(context),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemMetadata(
                          icon: Icons.schedule,
                          label: '${meal.duration} min',
                        ),
                        const SizedBox(width: 15),
                        MealItemMetadata(
                          icon: Icons.work,
                          label: convertTitleCase(meal.complexity.name),
                        ),
                        const SizedBox(width: 15),
                        MealItemMetadata(
                          icon: Icons.currency_rupee_rounded,
                          label: convertTitleCase(meal.affordability.name),
                        ),
                        const SizedBox(width: 15),
                        MealItemMetadata(
                          icon: meal.isVegetarian
                              ? Icons.grass
                              : Icons.cruelty_free_outlined,
                          label: meal.isVegetarian ? "Veg" : "Non-veg",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
