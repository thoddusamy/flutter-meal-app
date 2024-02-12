import 'package:flutter/material.dart';
import 'package:meal_app/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.category, required this.onTapcategory});

  final CategoryModel category;
  final void Function() onTapcategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapcategory,
      splashColor: Colors.black26,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(.5),
              category.color.withOpacity(1),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
