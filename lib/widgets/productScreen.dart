import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/menu_drawer.dart';

import 'add_new_products.dart';

class ProductScreen extends StatelessWidget {
  final List<MealsModel> meals;
  static const routeName = "productScreen";
  const ProductScreen({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mahsulotalr"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddNewProducts.routeName);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: meals[index].imhUrl[0].startsWith("assets/")
                  ? AssetImage(meals[index].imhUrl[0])
                  : NetworkImage(meals[index].imhUrl[0]) as ImageProvider,
            ),
            title: Text(meals[index].title),
            subtitle: Text("${meals[index].price} so'm"),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                size: 20,
              ),
            ),
          );
        },
      ),
      drawer: MenuDrawer(),
    );
  }
}
