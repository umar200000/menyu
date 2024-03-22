import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovqatlar_minyusi/model_page/categories_model.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/categories_meals_screens.dart';
import 'package:ovqatlar_minyusi/widgets/meal_items.dart';

import 'food_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Categories categories = Categories();
    MealsKeeper mealsKeeper = MealsKeeper();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.caudex().fontFamily,
      ),
      home: CategoriesScreen(
          list: categories.categoriesList, mealsList: mealsKeeper.mealsList),
      routes: {
        '/categories_meals_screens': (ctx) => CategoriesMealsScreens(),
        MealItems.routName: (ctx) => MealItems(),
      },
    );
  }
}
