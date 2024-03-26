import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/meal_items.dart';

import 'meals-photo.dart';

class CategoriesMealsScreens extends StatelessWidget {
  final void Function(String id, int a) toggleLike;
  final bool Function(String id) isLike;
  const CategoriesMealsScreens(this.toggleLike, this.isLike, {super.key});

  @override
  Widget build(BuildContext context) {
    final meal =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final foodName = meal["categoryTitle"] as String;
    final list = meal["mealList"] as List<MealsModel>;
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          foodName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: list.length > 0
          ? ListView.builder(
              padding: EdgeInsets.all(15),
              itemBuilder: (contex, index) {
                return MealPhoto(
                  meal: list[index],
                  toggleLike: toggleLike,
                  isLike: isLike,
                );
              },
              itemCount: list.length,
            )
          : Center(
              child: Text("Hozircha bu katego'riyada ovqatlar mavjud emas"),
            ),
    );
  }
}
