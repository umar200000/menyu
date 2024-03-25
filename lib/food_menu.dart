import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/categories_list.dart';

import 'model_page/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoriesModel> list;
  final List<MealsModel> mealsList;
  const CategoriesScreen(
      {super.key, required this.list, required this.mealsList});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: list.map((element) {
        final categoryMeals =
            mealsList.where((ele) => ele.categoryId == element.id).toList();
        return CategoriesList(element, categoryMeals);
      }).toList(),
    );
  }
}
