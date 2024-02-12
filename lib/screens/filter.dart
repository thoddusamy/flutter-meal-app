import 'package:flutter/material.dart';

enum Filters { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var isGluttenFree = false;
  var isLactoseFree = false;
  var isvegetarian = false;
  var isVegan = false;

  @override
  void initState() {
    super.initState();
    isGluttenFree = widget.currentFilters[Filters.glutenFree]!;
    isLactoseFree = widget.currentFilters[Filters.lactoseFree]!;
    isvegetarian = widget.currentFilters[Filters.vegetarian]!;
    isVegan = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filters.glutenFree: isGluttenFree,
            Filters.lactoseFree: isLactoseFree,
            Filters.vegetarian: isvegetarian,
            Filters.vegan: isVegan,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: isGluttenFree,
              onChanged: (value) {
                setState(() {
                  isGluttenFree = value;
                });
              },
              title: const Text(
                "Gluten-free",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes gluten-free meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SwitchListTile(
              value: isLactoseFree,
              onChanged: (value) {
                setState(() {
                  isLactoseFree = value;
                });
              },
              title: const Text(
                "Lactose-free",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes lactose-free meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SwitchListTile(
              value: isvegetarian,
              onChanged: (value) {
                setState(() {
                  isvegetarian = value;
                });
              },
              title: const Text(
                "Vegetarian",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes vegetarian meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
            SwitchListTile(
              value: isVegan,
              onChanged: (value) {
                setState(() {
                  isVegan = value;
                });
              },
              title: const Text(
                "Vegan",
                style: TextStyle(fontSize: 20),
              ),
              activeColor: Colors.blueGrey,
              inactiveTrackColor: Colors.blueGrey[200],
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              subtitle: const Text(
                "Only includes vegan meals.",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
