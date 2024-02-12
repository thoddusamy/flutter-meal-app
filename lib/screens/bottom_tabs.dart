import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';
import 'package:meal_app/models/meal_model.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filter.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/side_drawer.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false,
};

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  var currentTabIndex = 0;
  final List<MealModel> favMealsList = [];
  var _onSelectedFilters = kInitialFilters;

  void _switchTabs(index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  void _toggleFavMeals(MealModel meal) {
    final isExist = favMealsList.contains(meal);

    if (isExist) {
      setState(() {
        favMealsList.remove(meal);
        _ontoggleSnackbar("Meal removed from favorites");
      });
    } else {
      setState(() {
        favMealsList.add(meal);
        _ontoggleSnackbar("Meal added to favorites");
      });
    }
  }

  void _ontoggleSnackbar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  void _onIdentifier(String identifier) async {
    if (identifier == 'filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
            builder: (context) => FilterScreen(
                  currentFilters: _onSelectedFilters,
                )),
      );
      setState(() {
        _onSelectedFilters = result!;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtersMeals = dummyMeals.where((meal) {
      if (_onSelectedFilters[Filters.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_onSelectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_onSelectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_onSelectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget activeScreen = CategoriesScreen(
      onToggleFavMeals: _toggleFavMeals,
      favMealList: favMealsList,
      filtersMeals: filtersMeals,
    );
    var activeScreenTitle = "Categories";
    if (currentTabIndex == 1) {
      activeScreen = MealsScreen(
        mealsList: favMealsList,
        onToggleFavMeals: _toggleFavMeals,
        favMealList: favMealsList,
      );
      activeScreenTitle = "Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        title: Text(activeScreenTitle),
      ),
      drawer: SideDrawer(onIdentifier: _onIdentifier),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _switchTabs,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: currentTabIndex == 0
                  ? const Icon(Icons.set_meal)
                  : const Icon(Icons.set_meal_outlined),
              label: 'Categories'),
          BottomNavigationBarItem(
              icon: currentTabIndex == 1
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_border),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
