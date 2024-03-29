import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/model_page/meals_model.dart';

import '../model_page/categories_model.dart';
import 'img_url_page.dart';

class AddNewProducts extends StatefulWidget {
  final List<CategoriesModel> categories;
  final void Function(MealsModel meal) addNewMeal;

  const AddNewProducts(
      {super.key, required this.categories, required this.addNewMeal});
  static const routeName = "add-new-products";

  @override
  State<AddNewProducts> createState() => _AddNewProductsState();
}

class _AddNewProductsState extends State<AddNewProducts> {
  late String categoryId;
  List<String> imgUrlList = [];
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();

  @override
  void initState() {
    categoryId = widget.categories[0].id;
    super.initState();
  }

  void _save() {
    final title = _titleController.text;
    final description = _descriptionController.text;
    final ingredients = _ingredientsController.text;
    final price = _priceController.text;
    final preparingTime = _preparingTimeController.text;
    final mainImage = _mainImageController.text;
    final firstImg = _firstImageController.text;
    final secondImg = _secondImageController.text;
    final thirdImg = _thirdImageController.text;

    if (title.isEmpty ||
        description.isEmpty ||
        ingredients.isEmpty ||
        price.isEmpty ||
        preparingTime.isEmpty ||
        mainImage.isEmpty ||
        firstImg.isEmpty ||
        secondImg.isEmpty ||
        thirdImg.isEmpty) return;

    final List<String> ingreds = ingredients.split(",");
    final List<String> imgs = [mainImage, firstImg, secondImg, thirdImg];
    widget.addNewMeal(
      MealsModel(
        id: UniqueKey().toString(),
        title: title,
        categoryId: categoryId,
        price: int.parse(price),
        ingredients: ingreds,
        description: description,
        imhUrl: imgs,
        preparingTime: int.parse(
          preparingTime,
        ),
      ),
    );
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ovqat Qo'shish"),
        centerTitle: true,
        actions: [IconButton(onPressed: _save, icon: const Icon(Icons.save))],
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
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: "Ovqat nomi",
                ),
              ),
              TextField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Ovqat Tarifi",
                ),
              ),
              TextField(
                controller: _ingredientsController,
                decoration: InputDecoration(
                  labelText: "Ovqat tarkibi (Misol uchun: Go'sht, Pomidor,..)",
                ),
              ),
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ovqat narxi",
                ),
              ),
              TextField(
                controller: _preparingTimeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Ovqat tayolash vaqti (minutda)",
                ),
              ),
              ImageUrlPage(
                textController: _mainImageController,
                labelText: "Asosiy rasm linkini kriting",
              ),
              ImageUrlPage(
                textController: _firstImageController,
                labelText: "Rasm 1 linkini kriting",
              ),
              ImageUrlPage(
                textController: _secondImageController,
                labelText: "Rasm 2 linkini kriting",
              ),
              ImageUrlPage(
                textController: _thirdImageController,
                labelText: "Rasm 3 linkini kriting",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
