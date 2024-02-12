import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key, required this.onIdentifier});

  final void Function(String identifier) onIdentifier;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amber[300]!,
                  Colors.amber,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Row(
              children: [
                Icon(Icons.fastfood_rounded, size: 32),
                SizedBox(width: 15),
                Text(
                  "Cooking Up!",
                  style: TextStyle(fontSize: 32),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant, size: 20),
            title: const Text("Meals", style: TextStyle(fontSize: 20)),
            onTap: () => onIdentifier("meals"),
          ),
          ListTile(
            leading: const Icon(Icons.settings, size: 20),
            title: const Text("Filters", style: TextStyle(fontSize: 20)),
            onTap: () => onIdentifier("filters"),
          ),
        ],
      ),
    );
  }
}
