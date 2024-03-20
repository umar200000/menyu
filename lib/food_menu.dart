import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/widgets/categories_list.dart';

import 'model_page/categories_model.dart';

class CategoriesScreen extends StatelessWidget {
  final List<CategoriesModel> list;
  const CategoriesScreen({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ovqatlar Menyusi"),
        centerTitle: true,
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final item in list) CategoriesList(item),
        ],
      ),
    );
  }
}
