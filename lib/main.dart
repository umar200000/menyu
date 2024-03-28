import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovqatlar_minyusi/bottom_bar.dart';
import 'package:ovqatlar_minyusi/model_page/categories_model.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/add_new_products.dart';
import 'package:ovqatlar_minyusi/widgets/categories_meals_screens.dart';
import 'package:ovqatlar_minyusi/widgets/meal_items.dart';
import 'package:ovqatlar_minyusi/widgets/productScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Categories categories = Categories();
  final MealsKeeper mealsKeeper = MealsKeeper();

  void addNewMeal(MealsModel meal) {
    mealsKeeper.addMeal(meal);
  }

  void toggleLike(String id, int a) {
    setState(() {
      mealsKeeper.toggleLike10(id, a);
    });
  }

  bool isLike(String id) {
    return mealsKeeper.favoriteMealsList().any((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.caudex().fontFamily,
      ),
      initialRoute: BottomBar.routeName,
      routes: {
        BottomBar.routeName: (ctx) => BottomBar(
              categoryList: categories.categoriesList,
              mealsKeeper: mealsKeeper,
              toggleLike: toggleLike,
              isLike: isLike,
            ),
        '/categories_meals_screens': (ctx) =>
            CategoriesMealsScreens(toggleLike, isLike),
        MealItems.routName: (ctx) => MealItems(),
        ProductScreen.routeName: (ctx) => ProductScreen(
              meals: mealsKeeper.mealsList,
            ),
        AddNewProducts.routeName: (ctx) => AddNewProducts(
            categories: categories.categoriesList, addNewMeal: addNewMeal),
      },
    );
  }
}
