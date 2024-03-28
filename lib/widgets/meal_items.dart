import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';

class MealItems extends StatefulWidget {
  MealItems({super.key});
  static const routName = "MealItems";

  @override
  State<MealItems> createState() => _MealItemsState();
}

class _MealItemsState extends State<MealItems> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as MealsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  height: 300.0,
                  viewportFraction: 1,
                  initialPage: currentIndex,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              items: meal.imhUrl.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: imgUrl.startsWith("assets/")
                          ? Image.asset(
                              imgUrl,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              imgUrl,
                              fit: BoxFit.cover,
                            ),
                    );
                  },
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: meal.imhUrl.map((img) {
                int index = meal.imhUrl.indexOf(img);
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index ? Colors.black : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                );
              }).toList(),
            ),
            Text(
              "${meal.price} so'm",
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tarifi: ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(meal.description),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: Card(
                margin: EdgeInsets.all(15),
                child: ListView.separated(
                    padding: EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return Text(meal.ingredients[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider();
                    },
                    itemCount: meal.ingredients.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
