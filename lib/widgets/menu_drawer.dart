import 'package:flutter/material.dart';
import 'package:ovqatlar_minyusi/widgets/productScreen.dart';

import '../bottom_bar.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  Widget listTileFun(IconData icon, String text, void Function() function) {
    return ListTile(
      onTap: function,
      leading: Icon(icon),
      title: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text(
            "MENU",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        listTileFun(Icons.home, "Bosh Sahifa", () {
          Navigator.pushReplacementNamed(context, BottomBar.routeName);
        }),
        Divider(height: 0),
        listTileFun(Icons.category, "Mahsulotlar", () {
          Navigator.pushReplacementNamed(context, ProductScreen.routeName);
        }),
      ],
    ));
  }
}
