import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/widgets/menu_drawer.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = "productScreen";
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mahsulotalr"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Salom"),
      ),
      drawer: MenuDrawer(),
    );
  }
}
