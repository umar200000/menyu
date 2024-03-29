import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';
import 'package:ovqatlar_minyusi/widgets/menu_drawer.dart';

import 'add_new_products.dart';

class ProductScreen extends StatefulWidget {
  final List<MealsModel> meals;
  final void Function(String id) deleteFood;
  static const routeName = "productScreen";
  const ProductScreen(
      {super.key, required this.meals, required this.deleteFood});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mahsulotalr"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddNewProducts.routeName)
                    .then((value) {
                  if (value != null) {
                    setState(() {});
                  }
                });
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  widget.meals[index].imhUrl[0].startsWith("assets/")
                      ? AssetImage(widget.meals[index].imhUrl[0])
                      : NetworkImage(widget.meals[index].imhUrl[0])
                          as ImageProvider,
            ),
            title: Text(widget.meals[index].title),
            subtitle: Text("${widget.meals[index].price} so'm"),
            trailing: IconButton(
              onPressed: () {
                widget.deleteFood(widget.meals[index].id);
              },
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
