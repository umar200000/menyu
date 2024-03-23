import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';

import 'meal_items.dart';

class MealPhoto extends StatelessWidget {
  final MealsModel meal;
  const MealPhoto({super.key, required this.meal});

  void goToMealIteam(BuildContext context) {
    Navigator.pushNamed(context, MealItems.routName, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goToMealIteam(context);
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(20), bottom: Radius.circular(5)),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    meal.imhUrl[0],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 200,
                    padding: EdgeInsets.all(10),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      meal.isLike ? Icons.favorite : Icons.favorite_outline,
                    ),
                  ),
                  Text("${meal.preparingTime} minut"),
                  Text("${meal.price} so'm"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
