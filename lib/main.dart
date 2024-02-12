import 'package:flutter/material.dart';
import 'package:meal_app/screens/bottom_tabs.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const BottomTabs(),
    );
  }
}
