import 'package:flutter/material.dart';

import 'food_menu.dart';
import 'model_page/categories_model.dart';
import 'model_page/meals_model.dart';

class BottomBar extends StatefulWidget {
  BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int bottomIndex = 0;

  Categories categories = Categories();

  MealsKeeper mealsKeeper = MealsKeeper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomIndex == 0 ? "Ovqatlar Menyusi" : "Sevimli Ovqatlar",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: bottomIndex == 0
          ? CategoriesScreen(
              list: categories.categoriesList,
              mealsList: mealsKeeper.mealsList,
            )
          : Center(
              child: Text("Sevimli Ovqatlar Mavjud Emas!"),
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: bottomIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        onTap: (value) {
          setState(() {
            bottomIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "Barchasi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Sevimli",
          ),
        ],
      ),
    );
  }
}
