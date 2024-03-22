import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/categories_model.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';

class CategoriesList extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final List<MealsModel> mealList;
  const CategoriesList(this.categoriesModel, this.mealList, {super.key});

  void goToMealsPage(BuildContext context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (ctx) => CategoriesMealsScreens(categoriesModel.title)));
    Navigator.pushNamed(
      context,
      "/categories_meals_screens",
      arguments: {
        "categoryTitle": categoriesModel.title,
        "mealList": mealList,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.hardEdge,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          goToMealsPage(context);
        },
        child: Stack(
          children: [
            Container(
              child: Image.asset(
                categoriesModel.imgUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                categoriesModel.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
