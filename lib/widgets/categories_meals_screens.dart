import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/meal_items.dart';

class CategoriesMealsScreens extends StatelessWidget {
  // final String foodName;
  CategoriesMealsScreens({super.key});

  void goToMealIteam(BuildContext context) {
    Navigator.pushNamed(context, MealItems.routName);
  }

  @override
  Widget build(BuildContext context) {
    final meal =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final foodName = meal["categoryTitle"] as String;
    final list = meal["mealList"] as List<MealsModel>;
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(foodName),
        centerTitle: true,
      ),
      body: list.length > 0
          ? ListView.builder(
              padding: EdgeInsets.all(15),
              itemBuilder: (contex, index) {
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
                                list[index].imhUrl,
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
                                  list[index].title,
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
                                  list[index].isLike
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                ),
                              ),
                              Text("${list[index].preparingTime} minut"),
                              Text("${list[index].price} so'm"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
