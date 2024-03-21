import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/categories_model.dart';

class CategoriesList extends StatelessWidget {
  final CategoriesModel categoriesModel;
  const CategoriesList(this.categoriesModel, {super.key});

  void goToMealsPage(BuildContext context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (ctx) => CategoriesMealsScreens(categoriesModel.title)));
    Navigator.pushNamed(
      context,
      "/categories_meals_screens",
      arguments: categoriesModel.title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToMealsPage(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
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
