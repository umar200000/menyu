import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/widgets/meals-photo.dart';

import '../model_page/meals_model.dart';

class FavoritePage extends StatefulWidget {
  final List<MealsModel> list;
  final void Function(String id, int a) toggleLike;
  final bool Function(String id) isLike;
  const FavoritePage(this.list, this.toggleLike, this.isLike, {super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  void _toggleLike(String id, int favoriteIndex) {
    favoriteIndex = widget.list.indexWhere((element) => element.id == id);

    setState(() {
      widget.toggleLike(id, favoriteIndex);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Sevimli taom o'chirlmoqda!"),
          MaterialButton(
            onPressed: () {
              setState(() {
                widget.toggleLike(id, favoriteIndex);
              });
              ScaffoldMessenger.of(context)
                  .removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss);
            },
            child: Text(
              "BEKOR QILISH",
              style: TextStyle(color: Colors.amber),
            ),
          ),
        ]),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.list.length > 0
        ? ListView.builder(
            padding: EdgeInsets.all(15),
            itemBuilder: (context, index) {
              return MealPhoto(
                  meal: widget.list[index],
                  toggleLike: _toggleLike,
                  isLike: widget.isLike);
            },
            itemCount: widget.list.length,
          )
        : Center(
            child: Text("Sevimli ovqatlar mavjud emas!"),
          );
  }
}
