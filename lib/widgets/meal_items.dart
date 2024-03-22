import 'package:flutter/material.dart';

class MealItems extends StatelessWidget {
  const MealItems({super.key});

  static const routName = "MealItems";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal Items"),
      ),
    );
  }
}
