import 'package:flutter/material.dart';

class CategoriesMealsScreens extends StatelessWidget {
  // final String foodName;
  CategoriesMealsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final String foodName =
        ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(foodName),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(15),
        itemBuilder: (contex, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular(5)),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/burger.jpg",
                      fit: BoxFit.cover,
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
                          "Burger",
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
                          Icons.favorite_outline,
                        ),
                      ),
                      Text("12 minut"),
                      Text("\$20"),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
