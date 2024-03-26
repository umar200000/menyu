import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/widgets/favorite_page.dart';
import 'package:ovqatlar_minyusi/widgets/menu_drawer.dart';

import 'food_menu.dart';
import 'model_page/categories_model.dart';
import 'model_page/meals_model.dart';

class BottomBar extends StatefulWidget {
  final List<CategoriesModel> categoryList;
  final MealsKeeper mealsKeeper;
  final void Function(String id, int a) toggleLike;
  final bool Function(String id) isLike;

  const BottomBar({
    super.key,
    required this.categoryList,
    required this.mealsKeeper,
    required this.toggleLike,
    required this.isLike,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int bottomIndex = 0;
  List<Widget> list = [];

  @override
  void initState() {
    list = [
      CategoriesScreen(
        list: widget.categoryList,
        mealsList: widget.mealsKeeper.mealsList,
      ),
      FavoritePage(
        widget.mealsKeeper.favoriteMealsList(),
        widget.toggleLike,
        widget.isLike,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bottomIndex == 0 ? "Ovqatlar Menyusi" : "Sevimli Ovqatlar",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      drawer: MenuDrawer(),
      body: list[bottomIndex],
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
