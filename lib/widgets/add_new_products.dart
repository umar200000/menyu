import 'package:flutter/material.dart';

import '../model_page/categories_model.dart';

class AddNewProducts extends StatefulWidget {
  final List<CategoriesModel> categories;
  const AddNewProducts({super.key, required this.categories});
  static const routeName = "add-new-products";

  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  late String categoryId;

  @override
  void initState() {
    categoryId = widget.categories[0].id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ovqat Qo'shish"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                items: widget.categories
                    .map((element) => DropdownMenuItem(
                          child: Text(element.title),
                          value: element.id,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    categoryId = value as String;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Ovqat nomi",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
